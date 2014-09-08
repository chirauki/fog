module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_datacenters_x_storage_tiers_x_pools(datacenter, tier, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/datacenters/#{datacenter}/storage/tiers/#{tier}/pools",
            :accept   => "application/vnd.abiquo.storagepools+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_datacenters_x_storage_tiers_x_pools(datacenter, tier, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
