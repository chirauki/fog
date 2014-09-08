module Fog
  module Compute
    class Abiquo
      class Real
        def post_config_categories(payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/config/categories",
            :accept   => "application/vnd.abiquo.category+json",
            :content  => "application/vnd.abiquo.category+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_config_categories(payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
