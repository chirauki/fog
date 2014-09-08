module Fog
  module Compute
    class Abiquo
      class Real
        def post_cloud_virtualdatacenters_x_volumes_x_action_move(virtualdatacenter, volume, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/volumes/#{volume}/action/move",
            :accept   => "application/vnd.abiquo.moved++json",
            :content  => "application/vnd.abiquo.links+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_cloud_virtualdatacenters_x_volumes_x_action_move(virtualdatacenter, volume, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
