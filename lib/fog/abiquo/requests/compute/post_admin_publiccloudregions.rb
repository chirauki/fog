module Fog
  module Compute
    class Abiquo
      class Real
        def post_admin_publiccloudregions(payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/admin/publiccloudregions",
            :accept   => "application/vnd.abiquo.publiccloudregion+json",
            :content  => "application/vnd.abiquo.publiccloudregion+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_admin_publiccloudregions(payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
