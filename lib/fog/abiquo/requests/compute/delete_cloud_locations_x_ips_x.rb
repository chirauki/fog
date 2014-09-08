module Fog
  module Compute
    class Abiquo
      class Real
        def delete_cloud_locations_x_ips_x(location, ip, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/cloud/locations/#{location}/ips/#{ip}",
          )
        end
      end

      class Mock
        def delete_cloud_locations_x_ips_x(location, ip, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
