module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_scopes_x(scope, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/scopes/#{scope}",
            :accept   => "application/vnd.abiquo.scope+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_scopes_x(scope, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
