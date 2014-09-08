module Fog
  module Compute
    class Abiquo
      class Real
        def post_config_hypervisortypes_x_action_checkcredentials(hypervisortype, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/config/hypervisortypes/#{hypervisortype}/action/checkcredentials",
            :accept   => "*/*",
            :content  => "application/vnd.abiquo.publiccloudcredentials+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_config_hypervisortypes_x_action_checkcredentials(hypervisortype, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
