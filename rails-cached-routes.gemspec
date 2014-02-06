# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cached_routes/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-cached-routes"
  spec.version       = CachedRoutes::VERSION
  spec.authors       = ["David McCullars"]
  spec.email         = ["david.mccullars@gmail.com"]
  spec.description   = %q{Cache expensive rails routes files to speed up rails stack}
  spec.summary       = <<-END
For large applications with extensive routes files, the expense of loading
the routes file for every command that requires the rails stack can become
painfully slow.  In this case, time can be saved by marshalling the
routes to a file so that subsequent loads of the rails stack can just
unmarshal that file and be on its way.
  END
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "> 3.2"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
