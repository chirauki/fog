module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_publiccloudregions_x_enterprises(publiccloudregion, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/publiccloudregions/#{publiccloudregion}/enterprises",
            :accept   => "application/vnd.abiquo.enterprises+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_publiccloudregions_x_enterprises(publiccloudregion, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
