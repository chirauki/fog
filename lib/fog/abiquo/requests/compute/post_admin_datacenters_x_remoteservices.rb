module Fog
  module Compute
    class Abiquo
      class Real
        def post_admin_datacenters_x_remoteservices(datacenter, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/admin/datacenters/#{datacenter}/remoteservices",
            :accept   => "application/vnd.abiquo.remoteservice+json",
            :content  => "application/vnd.abiquo.remoteservice+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_admin_datacenters_x_remoteservices(datacenter, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
