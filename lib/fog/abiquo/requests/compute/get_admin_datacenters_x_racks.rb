module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_datacenters_x_racks(datacenter, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/datacenters/#{datacenter}/racks",
            :accept   => "application/vnd.abiquo.racks+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_datacenters_x_racks(datacenter, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
