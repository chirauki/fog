module Fog
  module Compute
    class Abiquo
      class Real
        def delete_config_costcodes_x(costcode, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/config/costcodes/#{costcode}",
          )
        end
      end

      class Mock
        def delete_config_costcodes_x(costcode, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
