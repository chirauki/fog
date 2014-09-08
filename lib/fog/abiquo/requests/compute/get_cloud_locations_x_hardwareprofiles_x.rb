module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_locations_x_hardwareprofiles_x(location, hardwareprofile, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/locations/#{location}/hardwareprofiles/#{hardwareprofile}",
            :accept   => "application/vnd.abiquo.hardwareprofile+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_locations_x_hardwareprofiles_x(location, hardwareprofile, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
