module Fog
  module Compute
    class Abiquo
      class Real
        def put_config_costcodes_x_currencies(costcode, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/config/costcodes/#{costcode}/currencies",
            :accept   => "application/vnd.abiquo.costcodecurrencies+json",
            :content  => "application/vnd.abiquo.costcodecurrencies+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_config_costcodes_x_currencies(costcode, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
