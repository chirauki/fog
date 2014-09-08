module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_enterprises_x_appslib_templateDefinitions_x(enterprise, templateDefinition, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/enterprises/#{enterprise}/appslib/templateDefinitions/#{templateDefinition}",
            :accept   => "application/vnd.abiquo.templatedefinition+json",
            :content  => "application/vnd.abiquo.templatedefinition+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_enterprises_x_appslib_templateDefinitions_x(enterprise, templateDefinition, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end