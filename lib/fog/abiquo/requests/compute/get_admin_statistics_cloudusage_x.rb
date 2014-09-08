module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_statistics_cloudusage_x(datacenter, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/statistics/cloudusage/#{datacenter}",
            :accept   => "*/*",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_statistics_cloudusage_x(datacenter, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
