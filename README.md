# Tangolicious

Wrapper for Tangocard RAAS API v2

*This gem is currently in development*

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tangolicious'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tangolicious

## Usage

Set your path and platform name and key:

```ruby
Tangolicious.platform_name = PLATFORM_NAME
Tangolicious.platform_key = PLATFORM_KEY
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.
You can run the console with your development credentials by running `PLATFORM_NAME=[name] PLATFORM_KEY=[key] bin/console`.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bonusly/tangolicious.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

