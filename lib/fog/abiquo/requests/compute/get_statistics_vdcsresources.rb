module Fog
  module Compute
    class Abiquo
      class Real
        def get_statistics_vdcsresources(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/statistics/vdcsresources",
            :accept   => "application/vnd.abiquo.virtualdatacentersresources+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_statistics_vdcsresources(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
