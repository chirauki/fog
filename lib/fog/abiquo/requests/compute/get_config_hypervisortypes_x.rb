module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_hypervisortypes_x(hypervisortype, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/hypervisortypes/#{hypervisortype}",
            :accept   => "application/vnd.abiquo.hypervisortype+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_hypervisortypes_x(hypervisortype, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
