module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_pricingtemplates(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/pricingtemplates",
            :accept   => "application/vnd.abiquo.pricingtemplates+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_pricingtemplates(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
