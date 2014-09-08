module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_diskformattypes_x(diskformattype, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/diskformattypes/#{diskformattype}",
            :accept   => "application/vnd.abiquo.diskformattype+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_diskformattypes_x(diskformattype, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
