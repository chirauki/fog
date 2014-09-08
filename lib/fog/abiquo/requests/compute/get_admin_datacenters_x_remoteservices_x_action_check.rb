module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_datacenters_x_remoteservices_x_action_check(datacenter, remoteservice, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/datacenters/#{datacenter}/remoteservices/#{remoteservice}/action/check",
            :accept   => "*/*",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_datacenters_x_remoteservices_x_action_check(datacenter, remoteservice, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
