module Fog
  module Compute
    class Abiquo
      class Real
        def delete_config_pricingtemplates_x(pricingtemplate, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/config/pricingtemplates/#{pricingtemplate}",
          )
        end
      end

      class Mock
        def delete_config_pricingtemplates_x(pricingtemplate, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
