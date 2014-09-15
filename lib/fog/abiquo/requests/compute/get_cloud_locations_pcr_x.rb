module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_locations_pcr_x(location, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/locations/#{location}",
            :accept   => "application/vnd.abiquo.publiccloudregion+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_locations_pcr_x(location, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
