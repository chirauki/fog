module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_users_x_applications_x(enterprise, user, application, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}/users/#{user}/applications/#{application}",
            :accept   => "application/vnd.abiquo.application+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_users_x_applications_x(enterprise, user, application, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
