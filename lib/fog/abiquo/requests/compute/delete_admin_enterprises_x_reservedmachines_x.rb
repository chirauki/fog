module Fog
  module Compute
    class Abiquo
      class Real
        def delete_admin_enterprises_x_reservedmachines_x(enterprise, machine, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/admin/enterprises/#{enterprise}/reservedmachines/#{machine}",
          )
        end
      end

      class Mock
        def delete_admin_enterprises_x_reservedmachines_x(enterprise, machine, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
