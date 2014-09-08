module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_backups_x(backup, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/backups/#{backup}",
            :accept   => "application/vnd.abiquo.backup+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_backups_x(backup, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
