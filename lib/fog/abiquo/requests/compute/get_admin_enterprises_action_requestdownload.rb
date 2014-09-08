module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_action_requestdownload(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/action/requestdownload",
            :accept   => "*/*",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_action_requestdownload(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
