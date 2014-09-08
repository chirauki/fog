module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_datacenters_x_racks_x(datacenter, rack, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/datacenters/#{datacenter}/racks/#{rack}",
            :accept   => "application/vnd.abiquo.rack+json",
            :content  => "application/vnd.abiquo.rack+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_datacenters_x_racks_x(datacenter, rack, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
