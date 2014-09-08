module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_publicvlans_x(virtualdatacenter, publicvlan, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}//publicvlans/#{publicvlan}",
            :accept   => "application/vnd.abiquo.vlan+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_publicvlans_x(virtualdatacenter, publicvlan, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
