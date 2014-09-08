module Fog
  module Compute
    class Abiquo
      class Real
        def put_config_currencies_x(currency, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/config/currencies/#{currency}",
            :accept   => "application/vnd.abiquo.currency+json",
            :content  => "application/vnd.abiquo.currency+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_config_currencies_x(currency, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
