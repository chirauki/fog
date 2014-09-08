module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_pricingtemplates_x_tiers_x(pricingtemplate, tier, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/pricingtemplates/#{pricingtemplate}/tiers/#{tier}",
            :accept   => "application/vnd.abiquo.pricingtier+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_pricingtemplates_x_tiers_x(pricingtemplate, tier, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
