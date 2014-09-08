module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_datacenters(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/datacenters",
            :accept   => "application/vnd.abiquo.datacenters_rs+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_datacenters(options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
