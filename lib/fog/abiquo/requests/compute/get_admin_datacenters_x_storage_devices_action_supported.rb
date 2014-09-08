module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_datacenters_x_storage_devices_action_supported(datacenter, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/datacenters/#{datacenter}/storage/devices/action/supported",
            :accept   => "application/vnd.abiquo.storagedevicesmetadata+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_datacenters_x_storage_devices_action_supported(datacenter, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
