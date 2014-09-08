module Fog
  module Compute
    class Abiquo
      class Real
        def put_cloud_virtualdatacenters_x(virtualdatacenter, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}",
            :accept   => "application/vnd.abiquo.virtualdatacenter+json",
            :content  => "application/vnd.abiquo.virtualdatacenter+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_cloud_virtualdatacenters_x(virtualdatacenter, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
