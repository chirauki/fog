module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_publiccloudregions_x(publiccloudregion, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/publiccloudregions/#{publiccloudregion}",
            :accept   => "application/vnd.abiquo.publiccloudregion+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_publiccloudregions_x(publiccloudregion, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
