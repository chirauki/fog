module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_privatenetworks_x_ips_x(virtualdatacenter, privatenetwork, ip, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/privatenetworks/#{privatenetwork}/ips/#{ip}",
            :accept   => "application/vnd.abiquo.privateip+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_privatenetworks_x_ips_x(virtualdatacenter, privatenetwork, ip, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
