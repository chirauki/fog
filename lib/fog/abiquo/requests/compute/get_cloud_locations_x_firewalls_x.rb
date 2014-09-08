module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_locations_x_firewalls_x(location, firewall, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/locations/#{location}/firewalls/#{firewall}",
            :accept   => "application/vnd.abiquo.firewallpolicy+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_locations_x_firewalls_x(location, firewall, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
