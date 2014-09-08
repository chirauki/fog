module Fog
  module Compute
    class Abiquo
      class Real
        def get_statistics_enterpriseresources_actions_total(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/statistics/enterpriseresources/actions/total",
            :accept   => "application/vnd.abiquo.enterpriseresources+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_statistics_enterpriseresources_actions_total(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
