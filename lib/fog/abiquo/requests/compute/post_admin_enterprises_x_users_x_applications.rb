module Fog
  module Compute
    class Abiquo
      class Real
        def post_admin_enterprises_x_users_x_applications(enterprise, user, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/admin/enterprises/#{enterprise}/users/#{user}/applications",
            :accept   => "application/vnd.abiquo.application+json",
            :content  => "application/vnd.abiquo.application+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_admin_enterprises_x_users_x_applications(enterprise, user, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
