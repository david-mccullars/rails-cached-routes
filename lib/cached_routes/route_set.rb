module CachedRoutes
  module RouteSet

    def self.included(base)
      base.alias_method_chain :draw, :caching
    end

    def draw_with_caching(*args, &block)
      marshaller = Marshaller.new
      if marshaller.can_unmarshal_routes?
        marshaller.unmarshal_routes(self.set.routes)
      else
        routes_before = self.set.routes.clone
        draw_without_caching(*args, &block)
        marshaller.marshal_routes(self.set.routes - routes_before)
      end
    end 

  end
end
