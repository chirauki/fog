module Fog
  module Compute
    class Abiquo
      class Real
        def post_cloud_virtualdatacenters_x_disks(virtualdatacenter, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/disks",
            :accept   => "application/vnd.abiquo.harddisk+json",
            :content  => "application/vnd.abiquo.harddisk+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_cloud_virtualdatacenters_x_disks(virtualdatacenter, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
