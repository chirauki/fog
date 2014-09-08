module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_datacenters_x_network_x_configuration_x(datacenter, publicnetwork, configuration, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/datacenters/#{datacenter}/network/#{publicnetwork}/configuration/#{configuration}",
            :accept   => "application/vnd.abiquo.networkconfiguration+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_datacenters_x_network_x_configuration_x(datacenter, publicnetwork, configuration, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
