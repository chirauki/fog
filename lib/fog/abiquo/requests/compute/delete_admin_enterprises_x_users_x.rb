module Fog
  module Compute
    class Abiquo
      class Real
        def delete_admin_enterprises_x_users_x(enterprise, user, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/admin/enterprises/#{enterprise}/users/#{user}",
          )
        end
      end

      class Mock
        def delete_admin_enterprises_x_users_x(enterprise, user, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
