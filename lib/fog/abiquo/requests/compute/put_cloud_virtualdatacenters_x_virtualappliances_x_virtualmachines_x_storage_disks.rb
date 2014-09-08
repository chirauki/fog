module Fog
  module Compute
    class Abiquo
      class Real
        def put_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_storage_disks(virtualdatacenter, virtualappliance, virtualmachine, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/virtualappliances/#{virtualappliance}/virtualmachines/#{virtualmachine}/storage/disks",
            :accept   => "*/*",
            :content  => "*/*",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_storage_disks(virtualdatacenter, virtualappliance, virtualmachine, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
