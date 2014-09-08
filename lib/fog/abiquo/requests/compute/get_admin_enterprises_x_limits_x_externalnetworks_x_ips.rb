module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_limits_x_externalnetworks_x_ips(enterprise, limit, externalnetwork, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}/limits/#{limit}/externalnetworks/#{externalnetwork}/ips",
            :accept   => "application/vnd.abiquo.externalips+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_limits_x_externalnetworks_x_ips(enterprise, limit, externalnetwork, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
