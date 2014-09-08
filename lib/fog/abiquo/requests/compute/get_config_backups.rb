module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_backups(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/backups",
            :accept   => "application/vnd.abiquo.backups+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_backups(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
