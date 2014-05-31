module Slideshare
  class Railtie < ::Rails::Railtie
    initializer 'slideshare' do
      Slideshare.setup
    end
  end
end
