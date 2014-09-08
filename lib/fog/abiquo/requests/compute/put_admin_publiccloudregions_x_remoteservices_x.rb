module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_publiccloudregions_x_remoteservices_x(publiccloudregion, remoteservice, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/publiccloudregions/#{publiccloudregion}/remoteservices/#{remoteservice}",
            :accept   => "application/vnd.abiquo.remoteservice+json",
            :content  => "application/vnd.abiquo.remoteservice+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_publiccloudregions_x_remoteservices_x(publiccloudregion, remoteservice, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
