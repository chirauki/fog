module Fog
  module Compute
    class Abiquo
      class Real
        def post_admin_enterprises_x_limits(enterprise, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/admin/enterprises/#{enterprise}/limits",
            :accept   => "application/vnd.abiquo.limit+json",
            :content  => "application/vnd.abiquo.limit+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_admin_enterprises_x_limits(enterprise, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
