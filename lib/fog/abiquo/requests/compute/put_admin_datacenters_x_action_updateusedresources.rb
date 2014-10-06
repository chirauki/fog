module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_datacenters_x_action_updateusedresources(datacenter, payload, options = {})
          request(
            :expects  => [204],
            :method   => 'PUT',
            :path     => "/admin/datacenters/#{datacenter}/action/updateusedresources",
            :accept   => "*/*",
            :content  => "*/*",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_datacenters_x_action_updateusedresources(datacenter, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
