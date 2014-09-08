module Fog
  module Compute
    class Abiquo
      class Real
        def post_admin_rules(payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/admin/rules",
            :accept   => "application/vnd.abiquo.rules+json",
            :content  => "application/vnd.abiquo.rules+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_admin_rules(payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
