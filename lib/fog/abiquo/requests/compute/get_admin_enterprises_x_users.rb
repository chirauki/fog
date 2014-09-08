module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_users(enterprise, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}/users",
            :accept   => "application/vnd.abiquo.users+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_users(enterprise, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
