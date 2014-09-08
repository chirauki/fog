module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_users_x_action_pendingtasks(enterprise, user, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}/users/#{user}//action/pendingtasks",
            :accept   => "application/vnd.abiquo.tasks+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_users_x_action_pendingtasks(enterprise, user, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end