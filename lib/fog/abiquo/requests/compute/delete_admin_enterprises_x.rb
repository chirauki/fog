module Fog
  module Compute
    class Abiquo
      class Real
        def delete_admin_enterprises_x(enterprise, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/admin/enterprises/#{enterprise}",
          )
        end
      end

      class Mock
        def delete_admin_enterprises_x(enterprise, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
