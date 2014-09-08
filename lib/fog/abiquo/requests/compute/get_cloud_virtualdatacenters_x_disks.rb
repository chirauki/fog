module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_disks(virtualdatacenter, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/disks",
            :accept   => "application/vnd.abiquo.harddisks+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_disks(virtualdatacenter, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
