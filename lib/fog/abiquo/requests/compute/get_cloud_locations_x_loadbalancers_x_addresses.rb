module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_locations_x_loadbalancers_x_addresses(location, loadbalancer, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/locations/#{location}/loadbalancers/#{loadbalancer}/addresses",
            :accept   => "application/vnd.abiquo.loadbalanceraddresses+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_locations_x_loadbalancers_x_addresses(location, loadbalancer, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
