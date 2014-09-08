module Fog
  module Compute
    class Abiquo
      class Real
        def delete_admin_enterprises_x_appslib_templateDefinitions_x(enterprise, templateDefinition, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/admin/enterprises/#{enterprise}/appslib/templateDefinitions/#{templateDefinition}",
          )
        end
      end

      class Mock
        def delete_admin_enterprises_x_appslib_templateDefinitions_x(enterprise, templateDefinition, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
