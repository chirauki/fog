module Fog
  module Compute
    class Abiquo
      class Real
        def post_admin_datacenters_x_network_x_ips(datacenter, publicnetwork, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/admin/datacenters/#{datacenter}/network/#{publicnetwork}/ips",
            :accept   => "application/vnd.abiquo.publicip+json",
            :content  => "application/vnd.abiquo.publicip+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_admin_datacenters_x_network_x_ips(datacenter, publicnetwork, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
