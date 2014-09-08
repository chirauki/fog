module Fog
  module Compute
    class Abiquo
      class Real
        def put_cloud_virtualdatacenters_x_virtualappliances_x_layers_x(virtualdatacenter, virtualappliance, layer, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/virtualappliances/#{virtualappliance}/layers/#{layer}",
            :accept   => "application/vnd.abiquo.layer+json",
            :content  => "application/vnd.abiquo.layer+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_cloud_virtualdatacenters_x_virtualappliances_x_layers_x(virtualdatacenter, virtualappliance, layer, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
