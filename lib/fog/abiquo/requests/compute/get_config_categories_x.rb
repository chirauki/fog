module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_categories_x(category, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/categories/#{category}",
            :accept   => "application/vnd.abiquo.category+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_categories_x(category, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
