module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_volumes_action_statefulcandidates(virtualdatacenter, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/volumes/action/statefulcandidates",
            :accept   => "*/*",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_volumes_action_statefulcandidates(virtualdatacenter, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
