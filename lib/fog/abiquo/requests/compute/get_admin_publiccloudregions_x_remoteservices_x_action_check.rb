module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_publiccloudregions_x_remoteservices_x_action_check(publiccloudregion, remoteservice, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/publiccloudregions/#{publiccloudregion}/remoteservices/#{remoteservice}/action/check",
            :accept   => "*/*",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_publiccloudregions_x_remoteservices_x_action_check(publiccloudregion, remoteservice, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
