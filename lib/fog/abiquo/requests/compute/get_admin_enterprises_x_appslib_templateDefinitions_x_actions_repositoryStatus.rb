module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_appslib_templateDefinitions_x_actions_repositoryStatus(enterprise, templateDefinition, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}/appslib/templateDefinitions/#{templateDefinition}/actions/repositoryStatus",
            :accept   => "application/vnd.abiquo.templatestate+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_appslib_templateDefinitions_x_actions_repositoryStatus(enterprise, templateDefinition, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
