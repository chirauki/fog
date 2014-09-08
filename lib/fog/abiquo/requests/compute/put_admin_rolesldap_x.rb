module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_rolesldap_x(roleldap, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/rolesldap/#{roleldap}",
            :accept   => "application/vnd.abiquo.roleldap+json",
            :content  => "application/vnd.abiquo.roleldap+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_rolesldap_x(roleldap, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
