module Fog
  module Compute
    class Abiquo
      class Real
        def delete_admin_rules_fitsPolicy_x(fitPolicy, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/admin/rules/fitsPolicy/#{fitPolicy}",
          )
        end
      end

      class Mock
        def delete_admin_rules_fitsPolicy_x(fitPolicy, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end