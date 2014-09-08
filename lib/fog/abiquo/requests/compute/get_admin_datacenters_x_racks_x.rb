module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_datacenters_x_racks_x(datacenter, rack, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/datacenters/#{datacenter}/racks/#{rack}",
            :accept   => "application/vnd.abiquo.rack+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_datacenters_x_racks_x(datacenter, rack, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
