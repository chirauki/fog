module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_locations_x_loadbalancers(location, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/locations/#{location}/loadbalancers",
            :accept   => "application/vnd.abiquo.loadbalancers+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_locations_x_loadbalancers(location, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
