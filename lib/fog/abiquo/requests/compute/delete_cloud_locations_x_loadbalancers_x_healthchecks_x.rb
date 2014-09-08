module Fog
  module Compute
    class Abiquo
      class Real
        def delete_cloud_locations_x_loadbalancers_x_healthchecks_x(location, loadbalancer, healthcheck, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/cloud/locations/#{location}/loadbalancers/#{loadbalancer}/healthchecks/#{healthcheck}",
          )
        end
      end

      class Mock
        def delete_cloud_locations_x_loadbalancers_x_healthchecks_x(location, loadbalancer, healthcheck, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
