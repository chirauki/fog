module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_categories(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/categories",
            :accept   => "application/vnd.abiquo.categories+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_categories(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
