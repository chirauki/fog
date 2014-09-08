module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_datacenters_x(datacenter, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/datacenters/#{datacenter}",
            :accept   => "application/vnd.abiquo.datacenter+json",
            :content  => "application/vnd.abiquo.datacenter+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_datacenters_x(datacenter, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
