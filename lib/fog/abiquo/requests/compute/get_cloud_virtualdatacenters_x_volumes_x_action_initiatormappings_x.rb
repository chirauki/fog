module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_volumes_x_action_initiatormappings_x(virtualdatacenter, volume, mapping, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/volumes/#{volume}/action/initiatormappings/#{mapping}",
            :accept   => "application/vnd.abiquo.initiatormapping+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_volumes_x_action_initiatormappings_x(virtualdatacenter, volume, mapping, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
