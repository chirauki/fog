module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_datacenters_x_action_discover(datacenter, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/datacenters/#{datacenter}/action/discover",
            :accept   => "application/vnd.abiquo.machines+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_datacenters_x_action_discover(datacenter, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
