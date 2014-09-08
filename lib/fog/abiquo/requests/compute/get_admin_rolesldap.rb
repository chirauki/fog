module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_rolesldap(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/rolesldap",
            :accept   => "application/vnd.abiquo.rolesldap+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_rolesldap(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
