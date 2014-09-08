module Fog
  module Compute
    class Abiquo
      class Real
        def delete_cloud_virtualdatacenters_x(virtualdatacenter, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}",
          )
        end
      end

      class Mock
        def delete_cloud_virtualdatacenters_x(virtualdatacenter, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
