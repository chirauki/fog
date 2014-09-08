module Fog
  module Compute
    class Abiquo
      class Real
        def post_admin_datacenters_x_racks_x_machines(datacenter, rack, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/admin/datacenters/#{datacenter}/racks/#{rack}/machines",
            :accept   => "application/vnd.abiquo.machine+json",
            :content  => "application/vnd.abiquo.machine+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_admin_datacenters_x_racks_x_machines(datacenter, rack, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
