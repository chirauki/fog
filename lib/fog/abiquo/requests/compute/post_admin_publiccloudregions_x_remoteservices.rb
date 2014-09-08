module Fog
  module Compute
    class Abiquo
      class Real
        def post_admin_publiccloudregions_x_remoteservices(publiccloudregion, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/admin/publiccloudregions/#{publiccloudregion}/remoteservices",
            :accept   => "application/vnd.abiquo.remoteservice+json",
            :content  => "application/vnd.abiquo.remoteservice+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_admin_publiccloudregions_x_remoteservices(publiccloudregion, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
