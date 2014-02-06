module CachedRoutes
  class Marshaller

    attr_reader :cached_file

    def initialize
      @cached_file = begin
        if caller_line = caller.detect { |li| !(li =~ /cached_routes/i) }
          caller_line.sub(/\.rb:.*/, '.cached')
        else
          Rails.root.join('config/routes.cached')
        end
      end
    end

    def can_unmarshal_routes?
      File.exist?(cached_file) && File.mtime(cached_file) >= File.mtime(__FILE__)
    end

    def marshal_routes(new_routes)
      new_routes.map! do |route|
        if ActionDispatch::Routing::Redirect === route.app
          route = route.clone
          route.instance_variable_set :@app, route.app.path({}, nil)
        end
        route
      end
      File.open(cached_file, 'wb') do |io|
        Marshal.dump(new_routes, io)
      end
      nil
    end

    def unmarshal_routes(routes)
      redirect_builder = Class.new { include ActionDispatch::Routing::Redirection }.new
      File.open(cached_file, 'rb') do |io|
        Marshal.load(io).each do |route|
          if String === route.app
            route.instance_variable_set :@app, redirect_builder.redirect(route.app)
          end
          routes << route
        end
      end
    end

  end
end
