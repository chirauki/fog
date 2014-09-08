module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_privatenetworks_x_loadbalancers(virtualdatacenter, privatenetwork, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/privatenetworks/#{privatenetwork}/loadbalancers",
            :accept   => "application/vnd.abiquo.loadbalancers+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_privatenetworks_x_loadbalancers(virtualdatacenter, privatenetwork, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
