module Fog
  module Compute
    class Abiquo
      class Real
        def create_rack(racks_lnk, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => racks_lnk,
            :accept   => 'application/vnd.abiquo.rack+json',
            :content  => 'application/vnd.abiquo.rack+json',
            :body     => payload
          )
        end
      end

      class Mock
        def create_rack
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
