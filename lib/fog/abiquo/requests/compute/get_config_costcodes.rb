module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_costcodes(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/costcodes",
            :accept   => "application/vnd.abiquo.costcodes+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_costcodes(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
