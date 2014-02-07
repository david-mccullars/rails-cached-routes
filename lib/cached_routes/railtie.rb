module CachedRoutes
  class Railtie < Rails::Railtie

    initializer "add_caching_of_routes" do |app|
      app.routes.singleton_class.send :include, RouteSet
    end

  end
end
