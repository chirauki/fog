module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_rules_enterpriseExclusions_x(enterpriseExclusion, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/rules/enterpriseExclusions/#{enterpriseExclusion}",
            :accept   => "application/vnd.abiquo.enterpriseexclusionrule+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_rules_enterpriseExclusions_x(enterpriseExclusion, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
