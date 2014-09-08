module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_enterprises_x(enterprise, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/enterprises/#{enterprise}",
            :accept   => "application/vnd.abiquo.enterprise+json",
            :content  => "application/vnd.abiquo.enterprise+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_enterprises_x(enterprise, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
