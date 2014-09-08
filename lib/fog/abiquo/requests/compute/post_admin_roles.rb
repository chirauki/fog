module Fog
  module Compute
    class Abiquo
      class Real
        def post_admin_roles(payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/admin/roles",
            :accept   => "application/vnd.abiquo.rolewithldap+json",
            :content  => "application/vnd.abiquo.rolewithldap+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_admin_roles(payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
