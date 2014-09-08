module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_datacenters_x_storage_devices(datacenter, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/datacenters/#{datacenter}/storage/devices",
            :accept   => "application/vnd.abiquo.storagedevices+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_datacenters_x_storage_devices(datacenter, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
