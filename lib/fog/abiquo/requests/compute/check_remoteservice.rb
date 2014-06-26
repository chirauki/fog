module Fog
  module Compute
    class Abiquo
      class Real
        def check_remoteservice(rs_lnk, options = {})
          request(
            :expects  => [204],
            :method   => 'GET',
            :path     => rs_lnk,
          )
        end
      end

      class Mock
        def check_remoteservice
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
