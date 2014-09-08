module Fog
  module Compute
    class Abiquo
      class Real
        def delete_cloud_locations_x_firewalls_x(location, firewall, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/cloud/locations/#{location}/firewalls/#{firewall}",
          )
        end
      end

      class Mock
        def delete_cloud_locations_x_firewalls_x(location, firewall, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
