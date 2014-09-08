module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_statistics_cloudusage(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/statistics/cloudusage",
            :accept   => "application/vnd.abiquo.cloudusages+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_statistics_cloudusage(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
