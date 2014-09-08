module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_rules_fitsPolicy(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/rules/fitsPolicy",
            :accept   => "application/vnd.abiquo.fitpolicyrules+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_rules_fitsPolicy(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
