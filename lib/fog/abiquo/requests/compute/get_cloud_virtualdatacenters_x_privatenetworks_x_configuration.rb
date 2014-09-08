module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_privatenetworks_x_configuration(virtualdatacenter, privatenetwork, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/privatenetworks/#{privatenetwork}/configuration",
            :accept   => "application/vnd.abiquo.networkconfiguration+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_privatenetworks_x_configuration(virtualdatacenter, privatenetwork, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
