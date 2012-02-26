module Routes
  class UrlHelper

    def initialize(routes)
      (class << self; self; end).class_eval do
        routes.each do |route|
          path_method = "#{route.method}_path"
          define_method path_method do |args|
            route.build(args)
          end

          url_method = "#{route.method}_url"
          define_method url_method do |args, host|
            #TODO: заменить на URI
            "http://#{host}#{route.build(args)}"
          end
        end
      end
    end
  end
end
