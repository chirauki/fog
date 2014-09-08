module Fog
  module Compute
    class Abiquo
      class Real
        def post_config_licenses(payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/config/licenses",
            :accept   => "application/vnd.abiquo.license+json",
            :content  => "application/vnd.abiquo.license+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_config_licenses(payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
