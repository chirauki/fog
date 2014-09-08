module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualmachines(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualmachines",
            :accept   => "application/vnd.abiquo.virtualmachineswithnode+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualmachines(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
