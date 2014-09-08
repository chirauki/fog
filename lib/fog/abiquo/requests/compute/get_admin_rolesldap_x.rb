module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_rolesldap_x(roleldap, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/rolesldap/#{roleldap}",
            :accept   => "application/vnd.abiquo.roleldap+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_rolesldap_x(roleldap, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
