module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_publiccloudregions_x_remoteservices(publiccloudregion, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/publiccloudregions/#{publiccloudregion}/remoteservices",
            :accept   => "application/vnd.abiquo.remoteservices+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_publiccloudregions_x_remoteservices(publiccloudregion, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
