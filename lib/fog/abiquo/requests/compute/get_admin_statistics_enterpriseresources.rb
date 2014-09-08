module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_statistics_enterpriseresources(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/statistics/enterpriseresources",
            :accept   => "application/vnd.abiquo.enterprisesresources+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_statistics_enterpriseresources(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
