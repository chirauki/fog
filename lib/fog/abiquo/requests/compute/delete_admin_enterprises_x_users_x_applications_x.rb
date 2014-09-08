module Fog
  module Compute
    class Abiquo
      class Real
        def delete_admin_enterprises_x_users_x_applications_x(enterprise, user, application, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/admin/enterprises/#{enterprise}/users/#{user}/applications/#{application}",
          )
        end
      end

      class Mock
        def delete_admin_enterprises_x_users_x_applications_x(enterprise, user, application, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
