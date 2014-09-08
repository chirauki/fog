module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_datacenters_x_network_x_ips(datacenter, publicnetwork, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/datacenters/#{datacenter}/network/#{publicnetwork}/ips",
            :accept   => "*/*",
            :content  => "application/vnd.abiquo.publicips+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_datacenters_x_network_x_ips(datacenter, publicnetwork, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
