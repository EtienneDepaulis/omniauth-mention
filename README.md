OmniAuth Mention
================

This is an [OmniAuth 1.0](https://github.com/intridea/omniauth) strategy for authenticating to Mention.

Get a Mention Oauth2.0 API key at their [Developers Area](https://dev.mention.net/login)

Usage
-----

In the Gemfile:

```ruby
gem 'omniauth'
gem 'omniauth-oauth2'
gem 'omniauth-mention'
```

In a Rack application:

```ruby
use OmniAuth::Builder do
  provider :mention, ENV['MENTION_KEY'], ENV['MENTION_SECRET'], {:provider_ignores_state => true}
end
```

For Rails, put this in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :mention, ENV['MENTION_KEY'], ENV['MENTION_SECRET'], {:provider_ignores_state => true}
end
```

Restart your server and visit */auth/mention* to try it out


Authors
-------

* [Etienne Depaulis (@EtienneDepaulis)](https://github.com/EtienneDepaulis)


License
-------

Copyright (c) 2013 Etienne Depaulis

This source code released under an MIT license.
