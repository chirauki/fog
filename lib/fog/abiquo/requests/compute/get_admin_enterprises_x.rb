module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x(enterprise, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}",
            :accept   => "application/vnd.abiquo.enterprise+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x(enterprise, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
