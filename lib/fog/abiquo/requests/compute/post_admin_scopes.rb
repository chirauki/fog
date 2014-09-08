module Fog
  module Compute
    class Abiquo
      class Real
        def post_admin_scopes(payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/admin/scopes",
            :accept   => "application/vnd.abiquo.scope+json",
            :content  => "application/vnd.abiquo.scope+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_admin_scopes(payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
