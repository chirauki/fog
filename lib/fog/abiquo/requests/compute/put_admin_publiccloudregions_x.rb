module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_publiccloudregions_x(publiccloudregion, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/publiccloudregions/#{publiccloudregion}",
            :accept   => "application/vnd.abiquo.publiccloudregion+json",
            :content  => "application/vnd.abiquo.publiccloudregion+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_publiccloudregions_x(publiccloudregion, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
