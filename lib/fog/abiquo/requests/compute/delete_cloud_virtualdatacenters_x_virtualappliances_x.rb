module Fog
  module Compute
    class Abiquo
      class Real
        def delete_cloud_virtualdatacenters_x_virtualappliances_x(virtualdatacenter, virtualappliance, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/virtualappliances/#{virtualappliance}",
          )
        end
      end

      class Mock
        def delete_cloud_virtualdatacenters_x_virtualappliances_x(virtualdatacenter, virtualappliance, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end