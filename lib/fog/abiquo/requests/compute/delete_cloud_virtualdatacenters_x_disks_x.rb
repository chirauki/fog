module Fog
  module Compute
    class Abiquo
      class Real
        def delete_cloud_virtualdatacenters_x_disks_x(virtualdatacenter, disk, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/disks/#{disk}",
          )
        end
      end

      class Mock
        def delete_cloud_virtualdatacenters_x_disks_x(virtualdatacenter, disk, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
