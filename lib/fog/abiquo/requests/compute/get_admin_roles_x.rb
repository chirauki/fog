module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_roles_x(role, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/roles/#{role}",
            :accept   => "application/vnd.abiquo.role+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_roles_x(role, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
