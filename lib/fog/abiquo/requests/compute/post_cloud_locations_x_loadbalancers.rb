module Fog
  module Compute
    class Abiquo
      class Real
        def post_cloud_locations_x_loadbalancers(location, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/cloud/locations/#{location}/loadbalancers",
            :accept   => "application/vnd.abiquo.loadbalancer+json",
            :content  => "application/vnd.abiquo.loadbalancer+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_cloud_locations_x_loadbalancers(location, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
