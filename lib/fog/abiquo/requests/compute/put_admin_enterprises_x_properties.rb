module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_enterprises_x_properties(enterprise, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/enterprises/#{enterprise}/properties",
            :accept   => "application/vnd.abiquo.enterpriseproperties+json",
            :content  => "application/vnd.abiquo.enterpriseproperties+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_enterprises_x_properties(enterprise, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
