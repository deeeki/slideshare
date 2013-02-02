require 'cgi'
require 'digest/sha1'
require 'active_support/core_ext/hash/conversions'
require 'active_support/core_ext/string/inflections'

module Slideshare
  class APIError < StandardError; end

  module API
    ENDPOINT = 'https://www.slideshare.net/api/2'
    attr_accessor :api_key, :shared_secret

    def setup
      @api_key ||= ENV['SLIDESHARE_API_KEY']
      @shared_secret ||= ENV['SLIDESHARE_SHARED_SECRET']
    end

    def configure
      yield self
      self
    end

    def get_slideshow params = {}
      get('/get_slideshow', params)
    end

    def search_slideshows params = {}
      get('/search_slideshows', params)
    end

    def get path, params = {}
      raise %["#{name}.api_key" and "#{name}.shared_secret must be set] if !@api_key || !@shared_secret
      timestamp = Time.now.to_i
      sha1 = Digest::SHA1.hexdigest("#{@shared_secret}#{timestamp}")
      params.merge!(:api_key => @api_key, :ts => timestamp, :hash => sha1)
      response = Hash.from_xml(Request.get("#{ENDPOINT}#{path}", params))
      raise APIError.new(response['SlideShareServiceError']['Message']) if response['SlideShareServiceError']
      structize(response)
    end

    def structize data
      case data
      when Array
        data.map{|i| structize(i) }
      when Hash
        class << data
          def method_missing name, *args
            self[name]
          end
        end

        data.keys.each do |k|
          data[k.to_s.underscore] = structize(data[k]) if k.is_a?(String) || k.is_a?(Symbol)
          data.delete(k)
        end

        data.symbolize_keys!
      when String
        CGI.unescapeHTML(data)
      else
        data
      end
    end
  end
end
