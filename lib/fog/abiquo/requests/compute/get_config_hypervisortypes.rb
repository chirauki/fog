module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_hypervisortypes(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/hypervisortypes",
            :accept   => "application/vnd.abiquo.hypervisortypes+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_hypervisortypes(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
