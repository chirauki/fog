module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_rules(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/rules",
            :accept   => "application/vnd.abiquo.rules+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_rules(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
