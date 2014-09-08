module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_datacenters_x_storage_tiers_x_action_restrictallenterprises(datacenter, tier, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/datacenters/#{datacenter}/storage/tiers/#{tier}/action/restrictallenterprises",
            :accept   => "*/*",
            :content  => "*/*",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_datacenters_x_storage_tiers_x_action_restrictallenterprises(datacenter, tier, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
