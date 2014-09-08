module Fog
  module Compute
    class Abiquo
      class Real
        def put_config_costcodes_x_currencies_x(costcode, currency, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/config/costcodes/#{costcode}/currencies/#{currency}",
            :accept   => "application/vnd.abiquo.costcodecurrency+json",
            :content  => "application/vnd.abiquo.costcodecurrency+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_config_costcodes_x_currencies_x(costcode, currency, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
