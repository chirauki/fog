module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_hypervisortypes_x_regions(hypervisortype, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/hypervisortypes/#{hypervisortype}/regions",
            :accept   => "application/vnd.abiquo.regions+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_hypervisortypes_x_regions(hypervisortype, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
