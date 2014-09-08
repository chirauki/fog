module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_action_unmanagedips(virtualdatacenter, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}//action/unmanagedips",
            :accept   => "application/vnd.abiquo.unmanagedips+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_action_unmanagedips(virtualdatacenter, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
