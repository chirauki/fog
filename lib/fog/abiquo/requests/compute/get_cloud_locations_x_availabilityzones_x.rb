module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_locations_x_availabilityzones_x(location, availabilityzone, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/locations/#{location}/availabilityzones/#{availabilityzone}",
            :accept   => "application/vnd.abiquo.availabilityzone+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_locations_x_availabilityzones_x(location, availabilityzone, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
