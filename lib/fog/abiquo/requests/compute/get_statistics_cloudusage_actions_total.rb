module Fog
  module Compute
    class Abiquo
      class Real
        def get_statistics_cloudusage_actions_total(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/statistics/cloudusage/actions/total",
            :accept   => "application/vnd.abiquo.cloudusage+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_statistics_cloudusage_actions_total(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
