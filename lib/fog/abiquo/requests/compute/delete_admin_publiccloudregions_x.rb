module Fog
  module Compute
    class Abiquo
      class Real
        def delete_admin_publiccloudregions_x(publiccloudregion, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/admin/publiccloudregions/#{publiccloudregion}",
          )
        end
      end

      class Mock
        def delete_admin_publiccloudregions_x(publiccloudregion, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
