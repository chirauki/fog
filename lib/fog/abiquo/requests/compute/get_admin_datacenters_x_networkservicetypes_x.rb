module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_datacenters_x_networkservicetypes_x(datacenter, networkservicetype, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/datacenters/#{datacenter}/networkservicetypes/#{networkservicetype}",
            :accept   => "application/vnd.abiquo.networkservicetype+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_datacenters_x_networkservicetypes_x(datacenter, networkservicetype, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
