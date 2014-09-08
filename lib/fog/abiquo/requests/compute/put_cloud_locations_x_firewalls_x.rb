module Fog
  module Compute
    class Abiquo
      class Real
        def put_cloud_locations_x_firewalls_x(location, firewall, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/cloud/locations/#{location}/firewalls/#{firewall}",
            :accept   => "application/vnd.abiquo.firewallpolicy+json",
            :content  => "application/vnd.abiquo.firewallpolicy+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_cloud_locations_x_firewalls_x(location, firewall, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
