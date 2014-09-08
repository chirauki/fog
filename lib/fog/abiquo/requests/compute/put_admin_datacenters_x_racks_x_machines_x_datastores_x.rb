module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_datacenters_x_racks_x_machines_x_datastores_x(datacenter, rack, machine, datastore, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/datacenters/#{datacenter}/racks/#{rack}/machines/#{machine}/datastores/#{datastore}",
            :accept   => "application/vnd.abiquo.datastore+json",
            :content  => "application/vnd.abiquo.datastore+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_datacenters_x_racks_x_machines_x_datastores_x(datacenter, rack, machine, datastore, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
