module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_limits_x_action_virtualappliances(enterprise, limit, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}/limits/#{limit}/action/virtualappliances",
            :accept   => "application/vnd.abiquo.virtualappliances+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_limits_x_action_virtualappliances(enterprise, limit, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
