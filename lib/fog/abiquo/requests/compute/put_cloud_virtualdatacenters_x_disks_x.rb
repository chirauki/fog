module Fog
  module Compute
    class Abiquo
      class Real
        def put_cloud_virtualdatacenters_x_disks_x(virtualdatacenter, disk, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/disks/#{disk}",
            :accept   => "application/vnd.abiquo.acceptedrequest+json",
            :content  => "application/vnd.abiquo.harddisk+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_cloud_virtualdatacenters_x_disks_x(virtualdatacenter, disk, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
