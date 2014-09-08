module Fog
  module Compute
    class Abiquo
      class Real
        def get_events_x(event, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/events/#{event}",
            :accept   => "application/vnd.abiquo.event+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_events_x(event, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
