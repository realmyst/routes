module Routes
  class Builder
    attr_reader :routes

    def initialize(*args, &block)
      @routes = []
      instance_eval(&block)
    end

    def self.build(*args, &block)
      builder = new(*args, &block)
      routing = Routing.new(:routes => builder.routes)
      routing
    end

    def match(url, opts = nil)
      match = Matcher.new(url, opts)
      @routes << Route.new(match.to_hash)
    end

  end
end
