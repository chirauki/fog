module Fog
  module Compute
    class Abiquo
      class Real
        def delete_admin_datacenters_x_networkservicetypes_x(datacenter, networkservicetype, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/admin/datacenters/#{datacenter}/networkservicetypes/#{networkservicetype}",
          )
        end
      end

      class Mock
        def delete_admin_datacenters_x_networkservicetypes_x(datacenter, networkservicetype, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
