module Fog
  module Compute
    class Abiquo
      class Real
        def delete_cloud_virtualdatacenters_x_volumes_x(virtualdatacenter, volume, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/volumes/#{volume}",
          )
        end
      end

      class Mock
        def delete_cloud_virtualdatacenters_x_volumes_x(virtualdatacenter, volume, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
