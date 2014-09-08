module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_locations_x_loadbalancers_x_healthstates(location, loadbalancer, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/locations/#{location}/loadbalancers/#{loadbalancer}/healthstates",
            :accept   => "application/vnd.abiquo.healthstates+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_locations_x_loadbalancers_x_healthstates(location, loadbalancer, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
