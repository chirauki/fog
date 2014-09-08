module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_roles_x_action_privileges(role, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/roles/#{role}/action/privileges",
            :accept   => "application/vnd.abiquo.links+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_roles_x_action_privileges(role, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
