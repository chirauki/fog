module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_privatenetworks_x_configuration_x(virtualdatacenter, privatenetwork, configuration, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/privatenetworks/#{privatenetwork}/configuration/#{configuration}",
            :accept   => "application/vnd.abiquo.networkconfiguration+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_privatenetworks_x_configuration_x(virtualdatacenter, privatenetwork, configuration, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
