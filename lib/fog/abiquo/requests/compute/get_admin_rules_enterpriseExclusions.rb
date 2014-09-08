module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_rules_enterpriseExclusions(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/rules/enterpriseExclusions",
            :accept   => "application/vnd.abiquo.enterpriseexclusionrules+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_rules_enterpriseExclusions(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
