module Fog
  module Compute
    class Abiquo
      class Real
        def post_admin_enterprises(payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/admin/enterprises",
            :accept   => "application/vnd.abiquo.enterprise+json",
            :content  => "application/vnd.abiquo.enterprise+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_admin_enterprises(payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
