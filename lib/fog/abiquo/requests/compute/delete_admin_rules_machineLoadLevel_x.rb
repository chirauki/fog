module Fog
  module Compute
    class Abiquo
      class Real
        def delete_admin_rules_machineLoadLevel_x(loadLevel, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/admin/rules/machineLoadLevel/#{loadLevel}",
          )
        end
      end

      class Mock
        def delete_admin_rules_machineLoadLevel_x(loadLevel, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
