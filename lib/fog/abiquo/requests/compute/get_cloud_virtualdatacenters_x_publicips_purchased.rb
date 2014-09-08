module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_publicips_purchased(virtualdatacenter, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}//publicips/purchased",
            :accept   => "application/vnd.abiquo.publicips+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_publicips_purchased(virtualdatacenter, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
