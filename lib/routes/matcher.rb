module Routes
  class Matcher
    CONSTRAIN = '([\w-]+)'

    def initialize(match, *opts)
      @match = {}
      parse(match)
    end

    def parse(match, *opt)
      resource = match.shift
      # post#show
      actions = resource[1].split("#")
      @match[:method] = match[:as].to_s
      @match[:path] = resource[0]
      @match[:regexp] = Regexp.new "^#{@match[:path].gsub(/(:[a-zA-Z]+)/, CONSTRAIN)}$"
      @match[:controller] = actions[0]
      @match[:action] = actions[1]
      @match
    end

    def controller
      @match[:controller]
    end

    def action
      @match[:action]
    end

    def regexp
      @match[:regexp]
    end

    def path
      @match[:path]
    end

    def to_hash
      @match
    end
  end
end
