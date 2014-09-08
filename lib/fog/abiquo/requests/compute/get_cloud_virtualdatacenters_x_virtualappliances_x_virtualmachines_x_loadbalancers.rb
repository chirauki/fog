module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_loadbalancers(virtualdatacenter, virtualappliance, virtualmachine, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/virtualappliances/#{virtualappliance}/virtualmachines/#{virtualmachine}/loadbalancers",
            :accept   => "application/vnd.abiquo.loadbalancers+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_loadbalancers(virtualdatacenter, virtualappliance, virtualmachine, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
