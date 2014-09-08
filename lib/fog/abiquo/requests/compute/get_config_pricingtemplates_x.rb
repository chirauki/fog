module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_pricingtemplates_x(pricingtemplate, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/pricingtemplates/#{pricingtemplate}",
            :accept   => "application/vnd.abiquo.pricingtemplate+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_pricingtemplates_x(pricingtemplate, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
