module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_appslib_templateDefinitionLists_x_actions_repositoryStatus(enterprise, templateDefinitionList, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}/appslib/templateDefinitionLists/#{templateDefinitionList}/actions/repositoryStatus",
            :accept   => "application/vnd.abiquo.templatestates+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_appslib_templateDefinitionLists_x_actions_repositoryStatus(enterprise, templateDefinitionList, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
