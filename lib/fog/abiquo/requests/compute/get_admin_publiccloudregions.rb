module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_publiccloudregions(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/publiccloudregions",
            :accept   => "application/vnd.abiquo.publiccloudregions+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_publiccloudregions(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
