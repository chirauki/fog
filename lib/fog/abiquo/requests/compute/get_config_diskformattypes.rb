module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_diskformattypes(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/diskformattypes",
            :accept   => "application/vnd.abiquo.diskformattypes+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_diskformattypes(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
