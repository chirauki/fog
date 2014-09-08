module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_enterprises_x_limits_x_externalnetworks_action_default(enterprise, limit, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/enterprises/#{enterprise}/limits/#{limit}/externalnetworks/action/default",
            :accept   => "*/*",
            :content  => "*/*",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_enterprises_x_limits_x_externalnetworks_action_default(enterprise, limit, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
