module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_costcodes_x(costcode, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/costcodes/#{costcode}",
            :accept   => "application/vnd.abiquo.costcode+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_costcodes_x(costcode, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
