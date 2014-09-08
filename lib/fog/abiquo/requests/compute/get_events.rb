module Fog
  module Compute
    class Abiquo
      class Real
        def get_events(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/events",
            :accept   => "application/vnd.abiquo.eventtypes+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_events(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
