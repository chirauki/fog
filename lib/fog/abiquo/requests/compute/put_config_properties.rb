module Fog
  module Compute
    class Abiquo
      class Real
        def put_config_properties(payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/config/properties",
            :accept   => "application/vnd.abiquo.systemproperties+json",
            :content  => "application/vnd.abiquo.systemproperties+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_config_properties(payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
