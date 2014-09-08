module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_enterprises_x_limits_x_externalnetworks_x_action_default(enterprise, limit, externalnetwork, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/enterprises/#{enterprise}/limits/#{limit}/externalnetworks/#{externalnetwork}/action/default",
            :accept   => "*/*",
            :content  => "*/*",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_enterprises_x_limits_x_externalnetworks_x_action_default(enterprise, limit, externalnetwork, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
