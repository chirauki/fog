module Fog
  module Compute
    class Abiquo
      class Real
        def post_cloud_locations_x_loadbalancers_x_healthchecks(location, loadbalancer, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/cloud/locations/#{location}/loadbalancers/#{loadbalancer}/healthchecks",
            :accept   => "application/vnd.abiquo.healthcheck+json",
            :content  => "application/vnd.abiquo.healthcheck+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_cloud_locations_x_loadbalancers_x_healthchecks(location, loadbalancer, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
