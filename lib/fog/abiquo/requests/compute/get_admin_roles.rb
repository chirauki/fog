module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_roles(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/roles",
            :accept   => "application/vnd.abiquo.roles+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_roles(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
