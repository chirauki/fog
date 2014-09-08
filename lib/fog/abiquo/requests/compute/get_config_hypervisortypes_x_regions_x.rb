module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_hypervisortypes_x_regions_x(hypervisortype, region, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/hypervisortypes/#{hypervisortype}/regions/#{region}",
            :accept   => "application/vnd.abiquo.region+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_hypervisortypes_x_regions_x(hypervisortype, region, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
