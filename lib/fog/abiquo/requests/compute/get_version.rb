module Fog
  module Compute
    class Abiquo
      class Real
        def get_version(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/version",
            :accept   => "*/*",
            :query    => options
          )
        end
      end

      class Mock
        def get_version(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
