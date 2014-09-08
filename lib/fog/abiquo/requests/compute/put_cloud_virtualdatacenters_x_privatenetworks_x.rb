module Fog
  module Compute
    class Abiquo
      class Real
        def put_cloud_virtualdatacenters_x_privatenetworks_x(virtualdatacenter, privatenetwork, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/privatenetworks/#{privatenetwork}",
            :accept   => "application/vnd.abiquo.vlan+json",
            :content  => "application/vnd.abiquo.vlan+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_cloud_virtualdatacenters_x_privatenetworks_x(virtualdatacenter, privatenetwork, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
