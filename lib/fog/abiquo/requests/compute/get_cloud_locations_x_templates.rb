module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_locations_x_templates(location, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/locations/#{location}/templates",
            :accept   => "application/vnd.abiquo.virtualmachinetemplates+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_locations_x_templates(location, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
