module Fog
  module Compute
    class Abiquo
      class Real
        def create_remoteservice(rss_lnk, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => rss_lnk,
            :accept   => 'application/vnd.abiquo.remoteservice+json',
            :content  => 'application/vnd.abiquo.remoteservice+json',
            :body     => payload
          )
        end
      end

      class Mock
        def create_remoteservice
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
