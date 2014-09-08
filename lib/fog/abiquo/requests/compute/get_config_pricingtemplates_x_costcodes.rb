module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_pricingtemplates_x_costcodes(pricingtemplate, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/pricingtemplates/#{pricingtemplate}/costcodes",
            :accept   => "application/vnd.abiquo.pricingcostcodes+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_pricingtemplates_x_costcodes(pricingtemplate, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
