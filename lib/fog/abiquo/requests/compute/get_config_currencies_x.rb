module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_currencies_x(currency, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/currencies/#{currency}",
            :accept   => "application/vnd.abiquo.currency+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_currencies_x(currency, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
