module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_locations_x_hardwareprofiles(location, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/locations/#{location}/hardwareprofiles",
            :accept   => "application/vnd.abiquo.hardwareprofiles+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_locations_x_hardwareprofiles(location, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
