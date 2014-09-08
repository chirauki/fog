module Fog
  module Compute
    class Abiquo
      class Real
        def get_login(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/login",
            :accept   => "application/vnd.abiquo.user+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_login(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
