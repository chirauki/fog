module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_publiccloudregions_x_enterprises_x(publiccloudregion, enterprise, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/publiccloudregions/#{publiccloudregion}/enterprises/#{enterprise}",
            :accept   => "application/vnd.abiquo.enterprise+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_publiccloudregions_x_enterprises_x(publiccloudregion, enterprise, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
