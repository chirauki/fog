module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_privatenetworks_x_ips(virtualdatacenter, privatenetwork, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/privatenetworks/#{privatenetwork}/ips",
            :accept   => "application/vnd.abiquo.privateips+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_privatenetworks_x_ips(virtualdatacenter, privatenetwork, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
