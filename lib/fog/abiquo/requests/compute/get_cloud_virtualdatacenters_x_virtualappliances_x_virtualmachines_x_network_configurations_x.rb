module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_network_configurations_x(virtualdatacenter, virtualappliance, virtualmachine, configuration, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/virtualappliances/#{virtualappliance}/virtualmachines/#{virtualmachine}/network/configurations/#{configuration}",
            :accept   => "application/vnd.abiquo.virtualmachinenetworkconfiguration+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_network_configurations_x(virtualdatacenter, virtualappliance, virtualmachine, configuration, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
