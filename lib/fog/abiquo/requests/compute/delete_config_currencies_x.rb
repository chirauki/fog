module Fog
  module Compute
    class Abiquo
      class Real
        def delete_config_currencies_x(currency, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/config/currencies/#{currency}",
          )
        end
      end

      class Mock
        def delete_config_currencies_x(currency, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
