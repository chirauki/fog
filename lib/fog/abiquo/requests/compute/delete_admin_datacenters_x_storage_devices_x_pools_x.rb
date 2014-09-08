module Fog
  module Compute
    class Abiquo
      class Real
        def delete_admin_datacenters_x_storage_devices_x_pools_x(datacenter, device, pool, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/admin/datacenters/#{datacenter}/storage/devices/#{device}/pools/#{pool}",
          )
        end
      end

      class Mock
        def delete_admin_datacenters_x_storage_devices_x_pools_x(datacenter, device, pool, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
