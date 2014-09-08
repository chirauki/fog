module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_locations_x_sslcertificates(location, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/locations/#{location}/sslcertificates",
            :accept   => "application/vnd.abiquo.sslcertificates+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_locations_x_sslcertificates(location, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
