module Fog
  module Compute
    class Abiquo
      class Real
        def post_config_pricingtemplates(payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/config/pricingtemplates",
            :accept   => "application/vnd.abiquo.pricingtemplate+json",
            :content  => "application/vnd.abiquo.pricingtemplate+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_config_pricingtemplates(payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
