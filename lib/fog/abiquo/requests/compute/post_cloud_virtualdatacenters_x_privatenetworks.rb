module Fog
  module Compute
    class Abiquo
      class Real
        def post_cloud_virtualdatacenters_x_privatenetworks(virtualdatacenter, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/privatenetworks",
            :accept   => "application/vnd.abiquo.vlan+json",
            :content  => "application/vnd.abiquo.vlan+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_cloud_virtualdatacenters_x_privatenetworks(virtualdatacenter, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
