module Routes
  class Route
    attr_reader :method, :regexp, :path

    def initialize(match)
      @path = match[:path]
      @regexp = match[:regexp]
      @method = match[:method]
      @controller = match[:controller]
      @action = match[:action]
    end

    def match?(url)
      url =~ @regexp
    end

    def build(params)
      result_path = path
      params.each_pair do |key, value|
        result_path = result_path.gsub(":#{key.to_s}", value.to_s)
      end
      result_path
    end

  end
end
