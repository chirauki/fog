module Fog
  module Compute
    class Abiquo
      class Real
        def post_admin_datacenters(payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/admin/datacenters",
            :accept   => "application/vnd.abiquo.datacenter+json",
            :content  => "application/vnd.abiquo.datacenter+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_admin_datacenters(payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
