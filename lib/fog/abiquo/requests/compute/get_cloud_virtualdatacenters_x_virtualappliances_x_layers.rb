module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_virtualappliances_x_layers(virtualdatacenter, virtualappliance, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/virtualappliances/#{virtualappliance}/layers",
            :accept   => "application/vnd.abiquo.layers+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_virtualappliances_x_layers(virtualdatacenter, virtualappliance, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
