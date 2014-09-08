module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_appslib_templateDefinitionLists_x(enterprise, templateDefinitionList, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}/appslib/templateDefinitionLists/#{templateDefinitionList}",
            :accept   => "application/vnd.abiquo.templatedefinitionlist+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_appslib_templateDefinitionLists_x(enterprise, templateDefinitionList, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end