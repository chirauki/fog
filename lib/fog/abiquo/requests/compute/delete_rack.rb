module Fog
  module Compute
    class Abiquo
      class Real
        def delete_rack(rack_lnk, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => rack_lnk
          )
        end
      end

      class Mock
        def delete_rack
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
