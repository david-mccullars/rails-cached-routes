module CachedRoutes
  class Railtie < Rails::Railtie

    initializer "add_caching_of_routes" do |app|
      app.routes.instance_eval do
        class << self
          include RouteSet
        end
      end
    end

  end
end
