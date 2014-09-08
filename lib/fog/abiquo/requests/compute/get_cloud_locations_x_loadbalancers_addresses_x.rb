module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_locations_x_loadbalancers_addresses_x(location, loadbalanceraddress, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/locations/#{location}/loadbalancers/addresses/#{loadbalanceraddress}",
            :accept   => "application/vnd.abiquo.loadbalanceraddress+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_locations_x_loadbalancers_addresses_x(location, loadbalanceraddress, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
