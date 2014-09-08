module Fog
  module Compute
    class Abiquo
      class Real
        def get_login_sessions(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/login/sessions",
            :accept   => "application/vnd.abiquo.sessions+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_login_sessions(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
