module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_privileges(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/privileges",
            :accept   => "application/vnd.abiquo.privileges+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_privileges(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
