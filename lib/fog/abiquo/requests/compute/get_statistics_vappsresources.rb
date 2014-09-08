module Fog
  module Compute
    class Abiquo
      class Real
        def get_statistics_vappsresources(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/statistics/vappsresources",
            :accept   => "application/vnd.abiquo.virtualappsresources+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_statistics_vappsresources(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
