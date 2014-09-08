module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_locations_x_firewalls_x_rules(location, firewall, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/locations/#{location}/firewalls/#{firewall}/rules",
            :accept   => "application/vnd.abiquo.firewallrules+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_locations_x_firewalls_x_rules(location, firewall, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
