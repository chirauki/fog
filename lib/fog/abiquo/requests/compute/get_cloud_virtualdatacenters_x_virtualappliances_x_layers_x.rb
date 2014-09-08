module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_virtualappliances_x_layers_x(virtualdatacenter, virtualappliance, layer, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/virtualappliances/#{virtualappliance}/layers/#{layer}",
            :accept   => "application/vnd.abiquo.layer+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_virtualappliances_x_layers_x(virtualdatacenter, virtualappliance, layer, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
