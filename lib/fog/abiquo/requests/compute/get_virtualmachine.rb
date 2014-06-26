module Fog
  module Compute
    class Abiquo
      class Real
        def get_virtualmachine(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "#{options[:virtualmachine_lnk]}/#{options[:virtualmachine_id]}",
            :accept   => 'application/vnd.abiquo.virtualmachine+json'
          )
        end
      end

      class Mock
        def get_virtualmachine
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
