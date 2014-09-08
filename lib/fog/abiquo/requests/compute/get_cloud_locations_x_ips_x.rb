module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_locations_x_ips_x(location, ip, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/locations/#{location}/ips/#{ip}",
            :accept   => "application/vnd.abiquo.publicip+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_locations_x_ips_x(location, ip, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
