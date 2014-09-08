module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_disks_x(virtualdatacenter, disk, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/disks/#{disk}",
            :accept   => "application/vnd.abiquo.harddisk+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_disks_x(virtualdatacenter, disk, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
