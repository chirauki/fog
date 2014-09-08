module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_datacenters_x_storage_devices_x_pools_x(datacenter, device, pool, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/datacenters/#{datacenter}/storage/devices/#{device}/pools/#{pool}",
            :accept   => "application/vnd.abiquo.storagepool+json",
            :content  => "application/vnd.abiquo.storagepool+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_datacenters_x_storage_devices_x_pools_x(datacenter, device, pool, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
