module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_loadbalancers(virtualdatacenter, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/loadbalancers",
            :accept   => "application/vnd.abiquo.loadbalancers+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_loadbalancers(virtualdatacenter, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
