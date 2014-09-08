module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_datacenters_x_remoteservices_x(datacenter, remoteservice, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/datacenters/#{datacenter}/remoteservices/#{remoteservice}",
            :accept   => "application/vnd.abiquo.remoteservice+json",
            :content  => "application/vnd.abiquo.remoteservice+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_datacenters_x_remoteservices_x(datacenter, remoteservice, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
