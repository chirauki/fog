module Fog
  module Compute
    class Abiquo
      class Real
        def delete_admin_rules_enterpriseExclusions_x(enterpriseExclusion, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/admin/rules/enterpriseExclusions/#{enterpriseExclusion}",
          )
        end
      end

      class Mock
        def delete_admin_rules_enterpriseExclusions_x(enterpriseExclusion, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
