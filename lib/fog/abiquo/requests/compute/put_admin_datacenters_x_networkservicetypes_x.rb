module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_datacenters_x_networkservicetypes_x(datacenter, networkservicetype, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/datacenters/#{datacenter}/networkservicetypes/#{networkservicetype}",
            :accept   => "application/vnd.abiquo.networkservicetype+json",
            :content  => "application/vnd.abiquo.networkservicetype+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_datacenters_x_networkservicetypes_x(datacenter, networkservicetype, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
