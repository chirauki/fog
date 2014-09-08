module Fog
  module Compute
    class Abiquo
      class Real
        def post_cloud_locations_x_ips(location, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/cloud/locations/#{location}/ips",
            :accept   => "application/vnd.abiquo.publicip+json",
            :content  => "application/vnd.abiquo.links+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_cloud_locations_x_ips(location, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
