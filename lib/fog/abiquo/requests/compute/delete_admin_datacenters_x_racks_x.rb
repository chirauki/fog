module Fog
  module Compute
    class Abiquo
      class Real
        def delete_admin_datacenters_x_racks_x(datacenter, rack, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/admin/datacenters/#{datacenter}/racks/#{rack}",
          )
        end
      end

      class Mock
        def delete_admin_datacenters_x_racks_x(datacenter, rack, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
