module Fog
  module Compute
    class Abiquo
      class Real
        def list_remoteservices(rss_lnk, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => rss_lnk,
            :accept  => 'application/vnd.abiquo.remoteservices+json'
          )
        end
      end

      class Mock
        def list_remoteservices(rss_lnk, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
