module Fog
  module Compute
    class Abiquo
      class Real
        def delete_admin_enterprises_x_limits_x(enterprise, limit, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/admin/enterprises/#{enterprise}/limits/#{limit}",
          )
        end
      end

      class Mock
        def delete_admin_enterprises_x_limits_x(enterprise, limit, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
