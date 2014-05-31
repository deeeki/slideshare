# Slideshare

A SlideShare API client.
Currently, It supports only `get_slideshow` and `search_slideshows` methods.

(Won't release on rubygems.org because halfway implementation and gemname conflict)

## Installation

Add this line to your application's Gemfile. **(use `github` option)**:

    gem 'slideshare', github: 'itzki/slideshare'

And then execute:

    $ bundle

## Setting

Set `SLIDESHARE_API_KEY` and `SLIDESHARE_SHARED_SECRET` environment variables.

With Rails, these are set automaticallly.
Without Rails, call `Slideshare.setup` explicitly before using.

Alternately, you can set directly.

    Slideshare.api_key = 'your_api_key'
    Slideshare.shared_secret = 'your_shared_secret'

## Usage

### Get Slideshow Information

    Slideshare.get_slideshow(slideshow_url: 'http://www.slideshare.net/user/title_slug')

### Slideshow Search

    Slideshare.search_slideshows(q: 'keyword')

### Return value

The above methods return Hash object converted from API's XML response.
`Slideshare.get_slideshow(#omit).slideshow` is real slide object.
The Hash object is extended as attribute accessible like `slide.title`.

## API references

- [SlideShare » Developer Documentation](http://www.slideshare.net/developers/documentation)

## Supported versions

- Ruby 1.9.3 or higher

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
