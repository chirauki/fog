module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_locations_x_loadbalancers_x_routingrules_x(location, loadbalancer, routingrule, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/locations/#{location}/loadbalancers/#{loadbalancer}/routingrules/#{routingrule}",
            :accept   => "application/vnd.abiquo.routingrule+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_locations_x_loadbalancers_x_routingrules_x(location, loadbalancer, routingrule, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
