module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_datacenters_x_network_x(datacenter, publicnetwork, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/datacenters/#{datacenter}/network/#{publicnetwork}",
            :accept   => "application/vnd.abiquo.vlan+json",
            :content  => "*/*",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_datacenters_x_network_x(datacenter, publicnetwork, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
