module Fog
  module Compute
    class Abiquo
      class Real
        def delete_admin_scopes_x(scope, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/admin/scopes/#{scope}",
          )
        end
      end

      class Mock
        def delete_admin_scopes_x(scope, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
