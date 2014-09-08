module Fog
  module Compute
    class Abiquo
      class Real
        def delete_cloud_locations_x_loadbalancers_x_routingrules_x(location, loadbalancer, routingrule, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/cloud/locations/#{location}/loadbalancers/#{loadbalancer}/routingrules/#{routingrule}",
          )
        end
      end

      class Mock
        def delete_cloud_locations_x_loadbalancers_x_routingrules_x(location, loadbalancer, routingrule, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
