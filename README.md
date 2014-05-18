# sinatra-nedry

![nedry](media/nedry.jpg)

## Installation

Either include in your Gemfile:

```ruby
gem 'sinatra-nedry'
```

Or, install for your system:

    > gem install sinatra-nedry

## Usage

### Protecting

Protect an action with [HTTP basic auth](http://en.wikipedia.org/wiki/Basic_access_authentication)
by wrapping it:

```ruby
get '/admin' do
  protected! do
    render_page :admin
  end
end
```

The username/password used to authenticate should be configured in your environment as
`ADMIN_USERNAME` and `ADMIN_PASSWORD` respectively.

### Feature flagging

If you want to flag an action so that it is only available
in production then it's very similar:


```ruby
get '/new_feature' do
  flagged! do
    render_page :new_feature
  end
end
```

This will page will only action will now only require authorization
if the `RACK_ENV` env variable is set to 'production'.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
