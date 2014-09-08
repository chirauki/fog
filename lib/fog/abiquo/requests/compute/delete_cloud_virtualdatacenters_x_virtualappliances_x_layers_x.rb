module Fog
  module Compute
    class Abiquo
      class Real
        def delete_cloud_virtualdatacenters_x_virtualappliances_x_layers_x(virtualdatacenter, virtualappliance, layer, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/virtualappliances/#{virtualappliance}/layers/#{layer}",
          )
        end
      end

      class Mock
        def delete_cloud_virtualdatacenters_x_virtualappliances_x_layers_x(virtualdatacenter, virtualappliance, layer, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
