module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_pricingtemplates_x_costcodes_x(pricingtemplate, costcode, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/pricingtemplates/#{pricingtemplate}/costcodes/#{costcode}",
            :accept   => "application/vnd.abiquo.pricingcostcode+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_pricingtemplates_x_costcodes_x(pricingtemplate, costcode, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
