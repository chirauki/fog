module Fog
  module Compute
    class Abiquo
      class Real
        def post_admin_datacenters_x_racks_x_machines_x_virtualmachines_x_action_capture(datacenter, rack, machine, virtualmachine, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/admin/datacenters/#{datacenter}/racks/#{rack}/machines/#{machine}/virtualmachines/#{virtualmachine}/action/capture",
            :accept   => "*/*",
            :content  => "*/*",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_admin_datacenters_x_racks_x_machines_x_virtualmachines_x_action_capture(datacenter, rack, machine, virtualmachine, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
