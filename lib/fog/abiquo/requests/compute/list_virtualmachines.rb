module Fog
  module Compute
    class Abiquo
      class Real
        def list_virtualmachines(virtualmachines_lnk, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => virtualmachines_lnk,
            :accept  => 'application/vnd.abiquo.virtualmachines+json'
          )
        end
      end

      class Mock
        def list_virtualmachines(virtualmachines_lnk, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
