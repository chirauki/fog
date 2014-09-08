module Fog
  module Compute
    class Abiquo
      class Real
        def post_admin_datacenters_x_storage_devices_x_pools(datacenter, device, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/admin/datacenters/#{datacenter}/storage/devices/#{device}/pools",
            :accept   => "application/vnd.abiquo.storagepools+json",
            :content  => "application/vnd.abiquo.storagepools+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_admin_datacenters_x_storage_devices_x_pools(datacenter, device, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
