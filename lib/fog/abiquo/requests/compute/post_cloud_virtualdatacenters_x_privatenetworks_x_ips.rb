module Fog
  module Compute
    class Abiquo
      class Real
        def post_cloud_virtualdatacenters_x_privatenetworks_x_ips(virtualdatacenter, privatenetwork, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/privatenetworks/#{privatenetwork}/ips",
            :accept   => "application/vnd.abiquo.privateip+json",
            :content  => "application/vnd.abiquo.privateip+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_cloud_virtualdatacenters_x_privatenetworks_x_ips(virtualdatacenter, privatenetwork, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
