module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_locations_x_availabilityzones(location, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/locations/#{location}/availabilityzones",
            :accept   => "application/vnd.abiquo.availabilityzones+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_locations_x_availabilityzones(location, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
