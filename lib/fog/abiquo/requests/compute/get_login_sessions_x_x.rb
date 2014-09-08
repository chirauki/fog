module Fog
  module Compute
    class Abiquo
      class Real
        def get_login_sessions_x_x(session, user, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/login/sessions/#{session}/#{user}",
            :accept   => "application/vnd.abiquo.session+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_login_sessions_x_x(session, user, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
