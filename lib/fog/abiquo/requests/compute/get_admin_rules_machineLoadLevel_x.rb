module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_rules_machineLoadLevel_x(loadLevel, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/rules/machineLoadLevel/#{loadLevel}",
            :accept   => "application/vnd.abiquo.machineloadrule+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_rules_machineLoadLevel_x(loadLevel, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
