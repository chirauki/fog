module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_properties(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/properties",
            :accept   => "application/vnd.abiquo.systemproperties+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_properties(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
