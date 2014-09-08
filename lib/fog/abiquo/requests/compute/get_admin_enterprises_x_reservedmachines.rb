module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_reservedmachines(enterprise, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}/reservedmachines",
            :accept   => "application/vnd.abiquo.reservedmachines+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_reservedmachines(enterprise, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end