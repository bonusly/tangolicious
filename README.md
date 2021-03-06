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

Optionally, you can set a default `account_identifier` and `customer_identifier` to avoid having to pass these in every post request.

```ruby
Tangolicious.account_identifier = ACCOUNT_IDENTIFIER
Tangolicious.customer_identifier = CUSTOMER_IDENTIFIER
```

See https://integration-www.tangocard.com/raas_api_console/v2/ for more detailed documentation about request and response parameters.

#### Customers

List all customers

```ruby
Tangolicious::Customer.list
```

Create a customer

```ruby
Tangolicious::Customer.create(customer_identifier: 'my_customer', display_name: 'My Customer')
```


Retrieve a customer

```ruby
Tangolicious::Customer.retrieve('my_customer')
```

List all accounts for a customer

```ruby
Tangolicious::Customer.accounts('my_customer')
```


Create an account for a customer

```ruby
Tangolicious::Customer.create_account('my_customer', account_identifier: 'my_account', contact_email: 'email', display_name: 'My Account')
```

#### Accounts

List all accounts

```ruby
Tangolicious::Account.list
```

Retrieve an account

```ruby
Tangolicious::Account.retrieve('my_account')
```

#### Fund

Fund an account with a credit card

```ruby
Tangolicious::CreditCard.fund(amount: 100, credit_card_token: 'cc_token', account_identifier: 'my_account')
```

Unregister a credit card

```ruby
Tangolicious::CreditCard.unregister(credit_card_token: 'cc_token')
```

List all credit cards

```ruby
Tangolicious::CreditCard.list
```

Register a credit card

```ruby
Tangolicious::CreditCard.register(
  billing_address: {
    address_line_1: '123 Main Street',
    city: 'Denver',
    country: 'USA',
    email_address: 'me@example.com',
    first_name: 'Bob',
    last_name: 'Smith',
    postal_code: '12345',
    state: 'CO'
  },
  credit_card: {
    expiration: '2020-01',
    number: '4007000000027',
    verification_number: '123'
  },
  ip_address: '192.168.0.1',
  label: 'my_card'
)
```

Retrieve a credit card

```ruby
Tangolicious::CreditCard.retrieve('cc_token')
```

#### Catalog

List all catalog brands

```ruby
response = Tangolicious::Catalog.list
brands = response[:brands]
```

#### Orders

List all orders

```ruby
response = Tangolicious::Order.list
orders = response[:orders]
```

Create an order

```ruby
Tangolicious::Order.create(amount: 100, utid: 'U791917')
```

Retrieve an order

```ruby
Tangolicious::Order.retrieve('reference_order_id')
```

Resend the email for an order

```ruby
Tangolicious::Order.resend('reference_order_id')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.
You can run the console with your development credentials by running `PLATFORM_NAME=[name] PLATFORM_KEY=[key] bin/console`.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bonusly/tangolicious.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## About Bonusly

![Bonusly Logo](https://bonusly-files.s3.amazonaws.com/bonusly-logo.png?small)

Bonusly is the fun and easy way to engage all of your employees and improve retention and productivity at every level of your organization.

Check out [our product](https://bonus.ly) or [our engineering blog](https://engineering.bonus.ly).
