module Fog
  module Compute
    class Abiquo
      class Real
        def get_login_sessions_x(session, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/login/sessions/#{session}",
            :accept   => "application/vnd.abiquo.sessions+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_login_sessions_x(session, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
