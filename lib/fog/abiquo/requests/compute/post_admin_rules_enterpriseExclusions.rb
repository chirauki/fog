module Fog
  module Compute
    class Abiquo
      class Real
        def post_admin_rules_enterpriseExclusions(payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/admin/rules/enterpriseExclusions",
            :accept   => "application/vnd.abiquo.enterpriseexclusionrule+json",
            :content  => "application/vnd.abiquo.enterpriseexclusionrule+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_admin_rules_enterpriseExclusions(payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
