module Fog
  module Compute
    class Abiquo
      class Real
        def get_datacenter(dc_id, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => '/admin/datacenters/%s' % dc_id,
            :accept   => 'application/vnd.abiquo.datacenter+json'
          )
        end
      end

      class Mock
        def get_datacenter
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
