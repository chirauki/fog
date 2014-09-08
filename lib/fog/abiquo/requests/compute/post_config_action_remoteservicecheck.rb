module Fog
  module Compute
    class Abiquo
      class Real
        def post_config_action_remoteservicecheck(payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/config/action/remoteservicecheck",
            :accept   => "*/*",
            :content  => "application/vnd.abiquo.remoteservice+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_config_action_remoteservicecheck(payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
