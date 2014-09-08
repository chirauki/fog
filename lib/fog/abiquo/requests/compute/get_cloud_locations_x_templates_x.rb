module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_locations_x_templates_x(location, template, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/locations/#{location}/templates/#{template}",
            :accept   => "application/vnd.abiquo.virtualmachinetemplate+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_locations_x_templates_x(location, template, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
