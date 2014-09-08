module Fog
  module Compute
    class Abiquo
      class Real
        def put_cloud_locations_x_loadbalancers_x_virtualmachines(location, loadbalancer, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/cloud/locations/#{location}/loadbalancers/#{loadbalancer}/virtualmachines",
            :accept   => "application/vnd.abiquo.links+json",
            :content  => "application/vnd.abiquo.links+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_cloud_locations_x_loadbalancers_x_virtualmachines(location, loadbalancer, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
