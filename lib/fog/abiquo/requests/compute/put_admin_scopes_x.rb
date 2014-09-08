module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_scopes_x(scope, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/scopes/#{scope}",
            :accept   => "application/vnd.abiquo.scope+json",
            :content  => "application/vnd.abiquo.scope+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_scopes_x(scope, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
