module Fog
  module Compute
    class Abiquo
      class Real
        def list_virtualdatacenters(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => '/cloud/virtualdatacenters',
            :accept  => 'application/vnd.abiquo.virtualdatacenters+json'
          )
        end
      end

      class Mock
        def list_virtualdatacenters(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
