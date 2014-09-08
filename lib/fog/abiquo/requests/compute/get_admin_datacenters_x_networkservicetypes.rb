module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_datacenters_x_networkservicetypes(datacenter, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/datacenters/#{datacenter}/networkservicetypes",
            :accept   => "application/vnd.abiquo.networkservicetypes+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_datacenters_x_networkservicetypes(datacenter, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
