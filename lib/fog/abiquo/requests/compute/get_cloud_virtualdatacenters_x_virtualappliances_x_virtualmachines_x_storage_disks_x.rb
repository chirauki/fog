module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_storage_disks_x(virtualdatacenter, virtualappliance, virtualmachine, disk, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/virtualappliances/#{virtualappliance}/virtualmachines/#{virtualmachine}/storage/disks/#{disk}",
            :accept   => "application/vnd.abiquo.harddisk+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_storage_disks_x(virtualdatacenter, virtualappliance, virtualmachine, disk, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
