module Fog
  module Compute
    class Abiquo
      class Real
        def delete_login_sessions_users_x(user, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/login/sessions/users/#{user}",
          )
        end
      end

      class Mock
        def delete_login_sessions_users_x(user, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
