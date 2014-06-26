module Fog
  module Compute
    class Abiquo
      class Real
        def delete_datacenter(dc_lnk, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => dc_lnk
          )
        end
      end

      class Mock
        def delete_datacenter
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
