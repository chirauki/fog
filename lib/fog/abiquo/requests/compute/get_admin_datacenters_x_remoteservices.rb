module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_datacenters_x_remoteservices(datacenter, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/datacenters/#{datacenter}/remoteservices",
            :accept   => "application/vnd.abiquo.remoteservices+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_datacenters_x_remoteservices(datacenter, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
