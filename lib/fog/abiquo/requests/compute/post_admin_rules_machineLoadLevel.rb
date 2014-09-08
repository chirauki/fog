module Fog
  module Compute
    class Abiquo
      class Real
        def post_admin_rules_machineLoadLevel(payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/admin/rules/machineLoadLevel",
            :accept   => "application/vnd.abiquo.machineloadrule+json",
            :content  => "application/vnd.abiquo.machineloadrule+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_admin_rules_machineLoadLevel(payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
