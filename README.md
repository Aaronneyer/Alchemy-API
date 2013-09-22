# Alchemy-API

This is an SDK for [AlchemyAPI](http://www.alchemyapi.com/api/).

## Installation

Add this line to your application's Gemfile:

    gem 'alchemy-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install alchemy-api

## Usage

```ruby
require 'alchemy-api'
@alchemy = AlchemyAPI::Client.new('your api key here')
@alchemy.TextGetTextSentiment(text: "some sample text in here")
@alchemy.URLGetTitle(url: 'http://github.com')
puts AlchemyAPI::Client::TEXT_FUNCTIONS # Returns the text functions. Can also use HTML_FUNCTIONS and URL_FUNCTIONS
```

Check out the [API](http://www.alchemyapi.com/api/) for full usage. All
functions are named according to their API call.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
