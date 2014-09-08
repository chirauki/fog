module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_currencies(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/currencies",
            :accept   => "application/vnd.abiquo.currencies+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_currencies(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
