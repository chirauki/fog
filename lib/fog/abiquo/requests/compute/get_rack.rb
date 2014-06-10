module Fog
  module Compute
    class Abiquo
      class Real
        def get_rack(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "#{options[:racks_lnk]}/#{options[:rack_id]}",
            :accept   => 'application/vnd.abiquo.rack+json'
          )
        end
      end

      class Mock
        def get_rack
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
