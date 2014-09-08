module Fog
  module Compute
    class Abiquo
      class Real
        def delete_admin_publiccloudregions_x_remoteservices_x(publiccloudregion, remoteservice, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/admin/publiccloudregions/#{publiccloudregion}/remoteservices/#{remoteservice}",
          )
        end
      end

      class Mock
        def delete_admin_publiccloudregions_x_remoteservices_x(publiccloudregion, remoteservice, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
