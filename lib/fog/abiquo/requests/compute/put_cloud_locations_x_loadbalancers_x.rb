module Fog
  module Compute
    class Abiquo
      class Real
        def put_cloud_locations_x_loadbalancers_x(location, loadbalancer, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/cloud/locations/#{location}/loadbalancers/#{loadbalancer}",
            :accept   => "application/vnd.abiquo.loadbalancer+json",
            :content  => "application/vnd.abiquo.loadbalancer+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_cloud_locations_x_loadbalancers_x(location, loadbalancer, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
