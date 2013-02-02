require 'open-uri'
require 'cgi'

module Slideshare
  module Request
    module_function
    def get url, params = {}
      url = "#{url}?#{build_query(params)}"
      open(url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read
    end

    def build_query params = {}
      params.to_a.map{|o| "#{o[0]}=#{CGI.escape(o[1].to_s)}" }.join('&')
    end
  end
end
