require 'active_support'

p "IN RAILS CACHED ROUTES"
module CachedRoutes

  extend ActiveSupport::Autoload

  autoload :Marshaller
  autoload :RouteSet

  eager_autoload do
    autoload :Railtie
  end

end
