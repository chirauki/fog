module Fog
  module Compute
    class Abiquo
      class Real
        def delete_admin_enterprises_x_appslib_templateDefinitionLists_x(enterprise, templateDefinitionList, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/admin/enterprises/#{enterprise}/appslib/templateDefinitionLists/#{templateDefinitionList}",
          )
        end
      end

      class Mock
        def delete_admin_enterprises_x_appslib_templateDefinitionLists_x(enterprise, templateDefinitionList, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
