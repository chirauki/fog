module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_virtualappliances_x_state(virtualdatacenter, virtualappliance, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/virtualappliances/#{virtualappliance}/state",
            :accept   => "application/vnd.abiquo.virtualappliancestate+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_virtualappliances_x_state(virtualdatacenter, virtualappliance, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
