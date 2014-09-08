module Fog
  module Compute
    class Abiquo
      class Real
        def delete_login_sessions_x_x(session, user, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/login/sessions/#{session}/#{user}",
          )
        end
      end

      class Mock
        def delete_login_sessions_x_x(session, user, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
