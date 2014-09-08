module Fog
  module Compute
    class Abiquo
      class Real
        def delete_cloud_virtualdatacenters_x_privatenetworks_x(virtualdatacenter, privatenetwork, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/privatenetworks/#{privatenetwork}",
          )
        end
      end

      class Mock
        def delete_cloud_virtualdatacenters_x_privatenetworks_x(virtualdatacenter, privatenetwork, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
