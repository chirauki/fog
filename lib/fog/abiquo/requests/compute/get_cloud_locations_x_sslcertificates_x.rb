module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_locations_x_sslcertificates_x(location, sslcertificate, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/locations/#{location}/sslcertificates/#{sslcertificate}",
            :accept   => "application/vnd.abiquo.sslcertificate+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_locations_x_sslcertificates_x(location, sslcertificate, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
