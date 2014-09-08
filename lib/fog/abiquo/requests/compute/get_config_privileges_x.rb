module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_privileges_x(privilege, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/privileges/#{privilege}",
            :accept   => "application/vnd.abiquo.privilege+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_privileges_x(privilege, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
