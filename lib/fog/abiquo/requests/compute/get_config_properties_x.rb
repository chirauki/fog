module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_properties_x(property, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/properties/#{property}",
            :accept   => "application/vnd.abiquo.systemproperty+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_properties_x(property, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
