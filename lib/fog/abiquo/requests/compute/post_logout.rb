module Fog
  module Compute
    class Abiquo
      class Real
        def post_logout(payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/logout",
            :accept   => "*/*",
            :content  => "*/*",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_logout(payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
