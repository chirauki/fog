module Fog
  module Compute
    class Abiquo
      class Real
        def delete_config_categories_x(category, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/config/categories/#{category}",
          )
        end
      end

      class Mock
        def delete_config_categories_x(category, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
