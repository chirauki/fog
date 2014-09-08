module Fog
  module Compute
    class Abiquo
      class Real
        def post_config_costcodes(payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/config/costcodes",
            :accept   => "application/vnd.abiquo.costcode+json",
            :content  => "application/vnd.abiquo.costcode+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_config_costcodes(payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
