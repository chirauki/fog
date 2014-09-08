module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_locations_x_ips(location, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/locations/#{location}/ips",
            :accept   => "application/vnd.abiquo.publicips+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_locations_x_ips(location, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
