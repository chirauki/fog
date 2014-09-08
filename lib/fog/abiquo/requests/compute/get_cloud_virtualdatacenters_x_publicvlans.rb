module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_publicvlans(virtualdatacenter, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}//publicvlans",
            :accept   => "application/vnd.abiquo.vlans+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_publicvlans(virtualdatacenter, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
