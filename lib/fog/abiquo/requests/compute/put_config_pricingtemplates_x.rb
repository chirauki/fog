module Fog
  module Compute
    class Abiquo
      class Real
        def put_config_pricingtemplates_x(pricingtemplate, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/config/pricingtemplates/#{pricingtemplate}",
            :accept   => "application/vnd.abiquo.pricingtemplate+json",
            :content  => "application/vnd.abiquo.pricingtemplate+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_config_pricingtemplates_x(pricingtemplate, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
