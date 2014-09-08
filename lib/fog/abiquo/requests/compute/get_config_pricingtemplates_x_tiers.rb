module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_pricingtemplates_x_tiers(pricingtemplate, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/pricingtemplates/#{pricingtemplate}/tiers",
            :accept   => "application/vnd.abiquo.pricingtiers+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_pricingtemplates_x_tiers(pricingtemplate, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
