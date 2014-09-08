module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_action_publicnetworks_x(enterprise, publicnetwork, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}//action/publicnetworks/#{publicnetwork}",
            :accept   => "application/vnd.abiquo.vlan+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_action_publicnetworks_x(enterprise, publicnetwork, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
