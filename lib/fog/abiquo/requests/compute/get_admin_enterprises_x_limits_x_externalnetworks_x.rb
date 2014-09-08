module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_limits_x_externalnetworks_x(enterprise, limit, externalnetwork, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}/limits/#{limit}/externalnetworks/#{externalnetwork}",
            :accept   => "application/vnd.abiquo.vlan+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_limits_x_externalnetworks_x(enterprise, limit, externalnetwork, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
