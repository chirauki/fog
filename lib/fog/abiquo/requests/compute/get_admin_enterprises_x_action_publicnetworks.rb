module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_action_publicnetworks(enterprise, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}//action/publicnetworks",
            :accept   => "application/vnd.abiquo.vlans+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_action_publicnetworks(enterprise, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
