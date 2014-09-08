module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_tiers_x(virtualdatacenter, tier, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/tiers/#{tier}",
            :accept   => "application/vnd.abiquo.tier+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_tiers_x(virtualdatacenter, tier, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
