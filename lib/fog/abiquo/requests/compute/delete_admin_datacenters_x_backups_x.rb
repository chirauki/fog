module Fog
  module Compute
    class Abiquo
      class Real
        def delete_admin_datacenters_x_backups_x(datacenter, backup, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/admin/datacenters/#{datacenter}/backups/#{backup}",
          )
        end
      end

      class Mock
        def delete_admin_datacenters_x_backups_x(datacenter, backup, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
