module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_locations_x_loadbalancers_addresses(location, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/locations/#{location}/loadbalancers/addresses",
            :accept   => "application/vnd.abiquo.loadbalanceraddresses+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_locations_x_loadbalancers_addresses(location, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
