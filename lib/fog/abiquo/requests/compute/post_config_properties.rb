module Fog
  module Compute
    class Abiquo
      class Real
        def post_config_properties(payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/config/properties",
            :accept   => "application/vnd.abiquo.systemproperty+json",
            :content  => "application/vnd.abiquo.systemproperty+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_config_properties(payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
