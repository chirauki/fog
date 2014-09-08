module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_storage_disks(virtualdatacenter, virtualappliance, virtualmachine, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/virtualappliances/#{virtualappliance}/virtualmachines/#{virtualmachine}/storage/disks",
            :accept   => "application/vnd.abiquo.harddisks+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_storage_disks(virtualdatacenter, virtualappliance, virtualmachine, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
