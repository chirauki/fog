module Fog
  module Compute
    class Abiquo
      class Real
        def delete_admin_datacenters_x_network_x(datacenter, publicnetwork, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/admin/datacenters/#{datacenter}/network/#{publicnetwork}",
          )
        end
      end

      class Mock
        def delete_admin_datacenters_x_network_x(datacenter, publicnetwork, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end