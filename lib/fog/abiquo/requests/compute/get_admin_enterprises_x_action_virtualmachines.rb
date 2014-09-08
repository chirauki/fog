module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_action_virtualmachines(enterprise, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}/action/virtualmachines",
            :accept   => "application/vnd.abiquo.virtualmachines+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_action_virtualmachines(enterprise, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
