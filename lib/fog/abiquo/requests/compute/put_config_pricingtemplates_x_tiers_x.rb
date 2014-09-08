module Fog
  module Compute
    class Abiquo
      class Real
        def put_config_pricingtemplates_x_tiers_x(pricingtemplate, tier, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/config/pricingtemplates/#{pricingtemplate}/tiers/#{tier}",
            :accept   => "application/vnd.abiquo.pricingtier+json",
            :content  => "application/vnd.abiquo.pricingtier+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_config_pricingtemplates_x_tiers_x(pricingtemplate, tier, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
