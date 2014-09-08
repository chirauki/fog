module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_datacenters_x_backups(datacenter, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/datacenters/#{datacenter}/backups",
            :accept   => "application/vnd.abiquo.backups+json",
            :content  => "application/vnd.abiquo.backups+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_datacenters_x_backups(datacenter, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end