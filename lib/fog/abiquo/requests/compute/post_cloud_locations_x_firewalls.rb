module Fog
  module Compute
    class Abiquo
      class Real
        def post_cloud_locations_x_firewalls(location, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/cloud/locations/#{location}/firewalls",
            :accept   => "application/vnd.abiquo.firewallpolicy+json",
            :content  => "application/vnd.abiquo.firewallpolicy+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_cloud_locations_x_firewalls(location, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
