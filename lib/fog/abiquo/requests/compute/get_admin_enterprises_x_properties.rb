module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_properties(enterprise, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}/properties",
            :accept   => "application/vnd.abiquo.enterpriseproperties+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_properties(enterprise, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
