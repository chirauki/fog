module Fog
  module Compute
    class Abiquo
      class Real
        def get_statistics_cloudusage(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/statistics/cloudusage",
            :accept   => "application/vnd.abiquo.cloudusages+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_statistics_cloudusage(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
