module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_firewalls(virtualdatacenter, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/firewalls",
            :accept   => "application/vnd.abiquo.firewallpolicies+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_firewalls(virtualdatacenter, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
