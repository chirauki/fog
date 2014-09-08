module Fog
  module Compute
    class Abiquo
      class Real
        def delete_admin_roles_x(role, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/admin/roles/#{role}",
          )
        end
      end

      class Mock
        def delete_admin_roles_x(role, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
