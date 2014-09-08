module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_datacenters_x_racks_x_machines_x(datacenter, rack, machine, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/datacenters/#{datacenter}/racks/#{rack}/machines/#{machine}",
            :accept   => "application/vnd.abiquo.machine+json",
            :content  => "application/vnd.abiquo.machine+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_datacenters_x_racks_x_machines_x(datacenter, rack, machine, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
