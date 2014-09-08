module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_datacenters_x_network_x_ips(datacenter, publicnetwork, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/datacenters/#{datacenter}/network/#{publicnetwork}/ips",
            :accept   => "application/vnd.abiquo.publicips+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_datacenters_x_network_x_ips(datacenter, publicnetwork, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
