module Fog
  module Compute
    class Abiquo
      class Real
        def post_admin_rules_fitsPolicy(payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/admin/rules/fitsPolicy",
            :accept   => "application/vnd.abiquo.fitpolicyrule+json",
            :content  => "application/vnd.abiquo.fitpolicyrule+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_admin_rules_fitsPolicy(payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end