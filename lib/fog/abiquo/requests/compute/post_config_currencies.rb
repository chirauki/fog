module Fog
  module Compute
    class Abiquo
      class Real
        def post_config_currencies(payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/config/currencies",
            :accept   => "application/vnd.abiquo.currency+json",
            :content  => "application/vnd.abiquo.currency+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_config_currencies(payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
