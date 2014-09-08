module Fog
  module Compute
    class Abiquo
      class Real
        def put_config_properties_x(property, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/config/properties/#{property}",
            :accept   => "application/vnd.abiquo.systemproperty+json",
            :content  => "application/vnd.abiquo.systemproperty+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_config_properties_x(property, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
