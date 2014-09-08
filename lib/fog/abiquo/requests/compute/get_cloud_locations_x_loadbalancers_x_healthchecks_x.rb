module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_locations_x_loadbalancers_x_healthchecks_x(location, loadbalancer, healthcheck, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/locations/#{location}/loadbalancers/#{loadbalancer}/healthchecks/#{healthcheck}",
            :accept   => "application/vnd.abiquo.healthcheck+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_locations_x_loadbalancers_x_healthchecks_x(location, loadbalancer, healthcheck, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
