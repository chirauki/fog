module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_hypervisortypes_x_metrics(hypervisortype, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/hypervisortypes/#{hypervisortype}/metrics",
            :accept   => "application/vnd.abiquo.metricsmetadata+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_hypervisortypes_x_metrics(hypervisortype, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
