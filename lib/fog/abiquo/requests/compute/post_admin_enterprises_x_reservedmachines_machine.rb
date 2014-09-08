module Fog
  module Compute
    class Abiquo
      class Real
        def post_admin_enterprises_x_reservedmachines_machine(enterprise, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/admin/enterprises/#{enterprise}/reservedmachines/machine",
            :accept   => "application/vnd.abiquo.machine+json",
            :content  => "*/*",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_admin_enterprises_x_reservedmachines_machine(enterprise, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
