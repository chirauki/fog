module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_datacenters_x_racks_x_machines_x_action_nics_refresh(datacenter, rack, machine, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/datacenters/#{datacenter}/racks/#{rack}/machines/#{machine}//action/nics/refresh",
            :accept   => "application/vnd.abiquo.machine+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_datacenters_x_racks_x_machines_x_action_nics_refresh(datacenter, rack, machine, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
