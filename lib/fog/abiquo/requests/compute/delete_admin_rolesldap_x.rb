module Fog
  module Compute
    class Abiquo
      class Real
        def delete_admin_rolesldap_x(roleldap, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/admin/rolesldap/#{roleldap}",
          )
        end
      end

      class Mock
        def delete_admin_rolesldap_x(roleldap, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
