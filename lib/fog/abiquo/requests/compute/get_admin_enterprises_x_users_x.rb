module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_users_x(enterprise, user, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}/users/#{user}",
            :accept   => "application/vnd.abiquo.user+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_users_x(enterprise, user, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end