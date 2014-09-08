module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x(virtualdatacenter, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}",
            :accept   => "application/vnd.abiquo.virtualdatacenter+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x(virtualdatacenter, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
