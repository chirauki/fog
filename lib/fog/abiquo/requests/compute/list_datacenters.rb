module Fog
  module Compute
    class Abiquo
      class Real
        def list_datacenters(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => '/admin/datacenters',
            :accept  => 'application/vnd.abiquo.datacenters+json'
          )
        end
      end

      class Mock
        def list_datacenters(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
