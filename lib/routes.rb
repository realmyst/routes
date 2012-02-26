require "routes/version"

module Routes
  autoload :Builder, "routes/builder"
  autoload :Matcher, "routes/matcher"
  autoload :Route, "routes/route"
  autoload :UrlHelper, "routes/url_helper"
  autoload :Routing, "routes/routing"


  def self.build(*args, &block)
    builder = Builder.build(*args, &block)
  end

  def self.match(*args)

  end
end
