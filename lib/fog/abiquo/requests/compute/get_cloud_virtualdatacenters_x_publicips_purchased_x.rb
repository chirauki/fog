module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_publicips_purchased_x(virtualdatacenter, ip, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}//publicips/purchased/#{ip}",
            :accept   => "application/vnd.abiquo.publicip+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_publicips_purchased_x(virtualdatacenter, ip, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
