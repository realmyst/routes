module Routes
  class Routing
    attr_reader :routes

    def initialize(opts)
      @routes = opts[:routes]
    end

    def url_helpers
      UrlHelper.new(@routes)
    end

    def find_by_url(url)
      routes.each do |route|
        return route if route.match?(url)
      end

      nil
    end
  end
end
