module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_datacenters_x_network_action_unmanagedips(datacenter, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/datacenters/#{datacenter}/network/action/unmanagedips",
            :accept   => "application/vnd.abiquo.unmanagedips+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_datacenters_x_network_action_unmanagedips(datacenter, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
