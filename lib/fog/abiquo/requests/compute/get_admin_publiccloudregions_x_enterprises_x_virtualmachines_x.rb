module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_publiccloudregions_x_enterprises_x_virtualmachines_x(publiccloudregion, enterprise, virtualmachine, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/publiccloudregions/#{publiccloudregion}/enterprises/#{enterprise}/virtualmachines/#{virtualmachine}",
            :accept   => "application/vnd.abiquo.virtualmachine+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_publiccloudregions_x_enterprises_x_virtualmachines_x(publiccloudregion, enterprise, virtualmachine, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
