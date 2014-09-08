module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_appslib_templateDefinitions_x(enterprise, templateDefinition, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}/appslib/templateDefinitions/#{templateDefinition}",
            :accept   => "application/vnd.abiquo.templatedefinition+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_appslib_templateDefinitions_x(enterprise, templateDefinition, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
