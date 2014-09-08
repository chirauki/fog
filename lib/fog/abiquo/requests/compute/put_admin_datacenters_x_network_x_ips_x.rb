module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_datacenters_x_network_x_ips_x(datacenter, publicnetwork, ip, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/datacenters/#{datacenter}/network/#{publicnetwork}/ips/#{ip}",
            :accept   => "application/vnd.abiquo.publicip+json",
            :content  => "application/vnd.abiquo.publicip+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_datacenters_x_network_x_ips_x(datacenter, publicnetwork, ip, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
