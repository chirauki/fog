module Fog
  module Compute
    class Abiquo
      class Real
        def delete_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_storage_volumes(virtualdatacenter, virtualappliance, virtualmachine, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/virtualappliances/#{virtualappliance}/virtualmachines/#{virtualmachine}/storage/volumes",
          )
        end
      end

      class Mock
        def delete_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_storage_volumes(virtualdatacenter, virtualappliance, virtualmachine, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
