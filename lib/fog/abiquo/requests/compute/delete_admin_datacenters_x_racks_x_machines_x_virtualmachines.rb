module Fog
  module Compute
    class Abiquo
      class Real
        def delete_admin_datacenters_x_racks_x_machines_x_virtualmachines(datacenter, rack, machine, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/admin/datacenters/#{datacenter}/racks/#{rack}/machines/#{machine}/virtualmachines",
          )
        end
      end

      class Mock
        def delete_admin_datacenters_x_racks_x_machines_x_virtualmachines(datacenter, rack, machine, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
