module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_enterprises_x_users_x(enterprise, user, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/enterprises/#{enterprise}/users/#{user}",
            :accept   => "application/vnd.abiquo.user+json",
            :content  => "application/vnd.abiquo.user+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_enterprises_x_users_x(enterprise, user, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
