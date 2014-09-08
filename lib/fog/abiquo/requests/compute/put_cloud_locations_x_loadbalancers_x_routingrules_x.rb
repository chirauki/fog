module Fog
  module Compute
    class Abiquo
      class Real
        def put_cloud_locations_x_loadbalancers_x_routingrules_x(location, loadbalancer, routingrule, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/cloud/locations/#{location}/loadbalancers/#{loadbalancer}/routingrules/#{routingrule}",
            :accept   => "application/vnd.abiquo.routingrule+json",
            :content  => "application/vnd.abiquo.routingrule+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_cloud_locations_x_loadbalancers_x_routingrules_x(location, loadbalancer, routingrule, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
