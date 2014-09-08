module Fog
  module Compute
    class Abiquo
      class Real
        def delete_config_costcodes_x_currencies_x(costcode, currency, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/config/costcodes/#{costcode}/currencies/#{currency}",
          )
        end
      end

      class Mock
        def delete_config_costcodes_x_currencies_x(costcode, currency, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
