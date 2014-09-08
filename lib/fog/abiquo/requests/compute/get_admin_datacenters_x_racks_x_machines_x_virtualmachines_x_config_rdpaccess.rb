module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_datacenters_x_racks_x_machines_x_virtualmachines_x_config_rdpaccess(datacenter, rack, machine, virtualmachine, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/datacenters/#{datacenter}/racks/#{rack}/machines/#{machine}/virtualmachines/#{virtualmachine}/config/rdpaccess",
            :accept   => "*/*",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_datacenters_x_racks_x_machines_x_virtualmachines_x_config_rdpaccess(datacenter, rack, machine, virtualmachine, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
