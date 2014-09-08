module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_roles_x(role, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/roles/#{role}",
            :accept   => "application/vnd.abiquo.rolewithldap+json",
            :content  => "application/vnd.abiquo.rolewithldap+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_roles_x(role, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
