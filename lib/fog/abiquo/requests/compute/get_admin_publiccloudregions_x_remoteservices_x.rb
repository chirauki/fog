module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_publiccloudregions_x_remoteservices_x(publiccloudregion, remoteservice, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/publiccloudregions/#{publiccloudregion}/remoteservices/#{remoteservice}",
            :accept   => "application/vnd.abiquo.remoteservice+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_publiccloudregions_x_remoteservices_x(publiccloudregion, remoteservice, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
