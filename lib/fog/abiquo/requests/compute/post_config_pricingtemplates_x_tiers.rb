module Fog
  module Compute
    class Abiquo
      class Real
        def post_config_pricingtemplates_x_tiers(pricingtemplate, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/config/pricingtemplates/#{pricingtemplate}/tiers",
            :accept   => "application/vnd.abiquo.pricingtiers+json",
            :content  => "application/vnd.abiquo.pricingtiers+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_config_pricingtemplates_x_tiers(pricingtemplate, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
