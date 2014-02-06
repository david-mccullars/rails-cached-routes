# Rails::Cached::Routes

For large applications with extensive routes files, the expense of loading
the routes file for every command that requires the rails stack can become
painfully slow.  In this case, time can be saved by marshalling the
routes to a file so that subsequent loads of the rails stack can just
unmarshal that file and be on its way.

## Installation

Add this line to your application's Gemfile:

    gem 'rails-cached-routes'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails-cached-routes

## Usage

No special steps are needed to utilize rails-cached-routes as the railtie
automatically adds the functionality into place.  For each route file
processed by rails, a .cached file will be created on-the-fly whenever
the rails stack is loaded the first time.  From then on the cached
file will be used until its timestamp becomes older than the original
routes file.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
