module Fog
  module Compute
    class Abiquo
      class Real
        def put_config_categories_x(category, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/config/categories/#{category}",
            :accept   => "application/vnd.abiquo.category+json",
            :content  => "application/vnd.abiquo.category+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_config_categories_x(category, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
