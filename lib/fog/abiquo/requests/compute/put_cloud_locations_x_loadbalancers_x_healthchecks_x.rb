module Fog
  module Compute
    class Abiquo
      class Real
        def put_cloud_locations_x_loadbalancers_x_healthchecks_x(location, loadbalancer, healthcheck, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/cloud/locations/#{location}/loadbalancers/#{loadbalancer}/healthchecks/#{healthcheck}",
            :accept   => "application/vnd.abiquo.healthcheck+json",
            :content  => "application/vnd.abiquo.healthcheck+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_cloud_locations_x_loadbalancers_x_healthchecks_x(location, loadbalancer, healthcheck, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
