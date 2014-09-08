module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_enterprises_x_appslib_templateDefinitionLists_x(enterprise, templateDefinitionList, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/enterprises/#{enterprise}/appslib/templateDefinitionLists/#{templateDefinitionList}",
            :accept   => "application/vnd.abiquo.templatedefinitionlist+json",
            :content  => "application/vnd.abiquo.templatedefinitionlist+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_enterprises_x_appslib_templateDefinitionLists_x(enterprise, templateDefinitionList, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
