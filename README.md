# sinatra-nedry

## Installation

Either include in your Gemfile:

```ruby
gem 'sinatra-nedry'
```

Or, install for your system:

    > gem install sinatra-nedry

## Usage

Protect an action with HTTP basic auth by wrapping it:

```ruby
get '/admin' do
  protected! do
    render_page :admin
  end
end
```

The username/password used to authenticate should be configured in your environment as
`ADMIN_USERNAME` and `ADMIN_PASSWORD` respectively.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
