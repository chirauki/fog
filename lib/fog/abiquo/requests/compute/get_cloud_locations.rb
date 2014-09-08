module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_locations(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/locations",
            :accept   => "application/vnd.abiquo.datacenters+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_locations(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
