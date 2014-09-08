module Fog
  module Compute
    class Abiquo
      class Real
        def put_config_costcodes_x(costcode, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/config/costcodes/#{costcode}",
            :accept   => "application/vnd.abiquo.costcode+json",
            :content  => "application/vnd.abiquo.costcode+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_config_costcodes_x(costcode, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
