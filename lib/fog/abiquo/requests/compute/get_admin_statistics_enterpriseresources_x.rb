module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_statistics_enterpriseresources_x(enterprise, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/statistics/enterpriseresources/#{enterprise}",
            :accept   => "*/*",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_statistics_enterpriseresources_x(enterprise, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
