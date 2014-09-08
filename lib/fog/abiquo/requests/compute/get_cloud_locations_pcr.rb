module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_locations_pcr(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/locations",
            :accept   => "application/vnd.abiquo.publiccloudregions+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_locations_pcr(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
