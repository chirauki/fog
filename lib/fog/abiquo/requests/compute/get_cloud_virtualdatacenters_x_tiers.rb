module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_tiers(virtualdatacenter, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/tiers",
            :accept   => "application/vnd.abiquo.tiers+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_tiers(virtualdatacenter, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
