module Fog
  module Compute
    class Abiquo
      class Real
        def get_statistics_enterpriseresources(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/statistics/enterpriseresources",
            :accept   => "application/vnd.abiquo.enterprisesresources+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_statistics_enterpriseresources(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
