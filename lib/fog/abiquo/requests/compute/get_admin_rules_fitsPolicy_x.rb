module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_rules_fitsPolicy_x(fitPolicy, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/rules/fitsPolicy/#{fitPolicy}",
            :accept   => "application/vnd.abiquo.fitpolicyrule+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_rules_fitsPolicy_x(fitPolicy, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
