module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_virtualappliances_x_action_price(virtualdatacenter, virtualappliance, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/virtualappliances/#{virtualappliance}/action/price",
            :accept   => "*/*",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_virtualappliances_x_action_price(virtualdatacenter, virtualappliance, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
