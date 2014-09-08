module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_licenses(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/licenses",
            :accept   => "application/vnd.abiquo.licenses+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_licenses(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
