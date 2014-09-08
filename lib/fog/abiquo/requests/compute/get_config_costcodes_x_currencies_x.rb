module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_costcodes_x_currencies_x(costcode, currency, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/costcodes/#{costcode}/currencies/#{currency}",
            :accept   => "application/vnd.abiquo.costcodecurrency+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_costcodes_x_currencies_x(costcode, currency, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
