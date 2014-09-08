module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_action_ips(enterprise, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}/action/ips",
            :accept   => "application/vnd.abiquo.privateips+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_action_ips(enterprise, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
