module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_datacenters_x_storage_devices_x_pools_x(datacenter, device, pool, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/datacenters/#{datacenter}/storage/devices/#{device}/pools/#{pool}",
            :accept   => "application/vnd.abiquo.storagepool+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_datacenters_x_storage_devices_x_pools_x(datacenter, device, pool, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
