module Fog
  module Compute
    class Abiquo
      class Real
        def delete_config_properties_x(property, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/config/properties/#{property}",
          )
        end
      end

      class Mock
        def delete_config_properties_x(property, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
