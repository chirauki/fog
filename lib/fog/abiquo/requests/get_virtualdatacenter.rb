module Fog
  module Compute
    class Abiquo
      class Real
        def get_virtualdatacenter(vdc_id, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => '/cloud/virtualdatacenters/%s' % [vdc_id]
          )
        end
      end

      class Mock
        def get_virtualdatacenter
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
