module Fog
  module Compute
    class Abiquo
      class Real
        def post_admin_enterprises_x_appslib_templateDefinitions_x_actions_repositoryInstall(enterprise, templateDefinition, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/admin/enterprises/#{enterprise}/appslib/templateDefinitions/#{templateDefinition}/actions/repositoryInstall",
            :accept   => "*/*",
            :content  => "*/*",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_admin_enterprises_x_appslib_templateDefinitions_x_actions_repositoryInstall(enterprise, templateDefinition, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
