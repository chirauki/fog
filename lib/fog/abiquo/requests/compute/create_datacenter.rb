module Fog
  module Compute
    class Abiquo
      class Real
        def create_datacenter(payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => '/admin/datacenters',
            :accept   => 'application/vnd.abiquo.datacenter+json',
            :content  => 'application/vnd.abiquo.datacenter+json',
            :body     => payload
          )
        end
      end

      class Mock
        def create_datacenter
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
