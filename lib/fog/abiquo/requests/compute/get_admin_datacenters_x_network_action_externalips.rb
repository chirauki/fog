module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_datacenters_x_network_action_externalips(datacenter, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/datacenters/#{datacenter}/network/action/externalips",
            :accept   => "application/vnd.abiquo.externalips+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_datacenters_x_network_action_externalips(datacenter, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
