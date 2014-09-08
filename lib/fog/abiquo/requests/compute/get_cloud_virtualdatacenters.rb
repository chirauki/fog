module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters",
            :accept   => "application/vnd.abiquo.virtualdatacenters+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
