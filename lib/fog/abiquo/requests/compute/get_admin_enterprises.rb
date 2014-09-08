module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises",
            :accept   => "application/vnd.abiquo.enterprises-id-name+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
