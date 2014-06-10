module Fog
  module Compute
    class Abiquo
      class Real
        def list_racks(racks_lnk, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => racks_lnk,
            :accept  => 'application/vnd.abiquo.racks+json'
          )
        end
      end

      class Mock
        def list_racks(racks_lnk, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
