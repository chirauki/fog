module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_appslib_templateDefinitionLists(enterprise, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}/appslib/templateDefinitionLists",
            :accept   => "application/vnd.abiquo.templatedefinitionlists+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_appslib_templateDefinitionLists(enterprise, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
