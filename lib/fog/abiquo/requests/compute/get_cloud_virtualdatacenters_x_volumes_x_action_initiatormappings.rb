module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_volumes_x_action_initiatormappings(virtualdatacenter, volume, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/volumes/#{volume}/action/initiatormappings",
            :accept   => "application/vnd.abiquo.initiatormappings+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_volumes_x_action_initiatormappings(virtualdatacenter, volume, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
