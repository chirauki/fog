module Fog
  module Compute
    class Abiquo
      class Real
        def put_config_pricingtemplates_x_costcodes_x(pricingtemplate, costcode, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/config/pricingtemplates/#{pricingtemplate}/costcodes/#{costcode}",
            :accept   => "application/vnd.abiquo.pricingcostcode+json",
            :content  => "application/vnd.abiquo.pricingcostcode+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_config_pricingtemplates_x_costcodes_x(pricingtemplate, costcode, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
