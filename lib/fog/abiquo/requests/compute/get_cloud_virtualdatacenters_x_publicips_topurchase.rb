module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_publicips_topurchase(virtualdatacenter, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}//publicips/topurchase",
            :accept   => "application/vnd.abiquo.publicips+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_publicips_topurchase(virtualdatacenter, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
