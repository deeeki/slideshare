require 'slideshare/api'
require 'slideshare/request'
require 'slideshare/version'

module Slideshare
  extend Slideshare::API
end

begin
  require 'rails'
  require_relative 'slideshare/railtie'
rescue LoadError
end
