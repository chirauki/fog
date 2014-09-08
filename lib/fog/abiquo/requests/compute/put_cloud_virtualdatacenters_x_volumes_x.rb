module Fog
  module Compute
    class Abiquo
      class Real
        def put_cloud_virtualdatacenters_x_volumes_x(virtualdatacenter, volume, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/volumes/#{volume}",
            :accept   => "application/vnd.abiquo.acceptedrequest+json",
            :content  => "*/*",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_cloud_virtualdatacenters_x_volumes_x(virtualdatacenter, volume, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
