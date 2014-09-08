module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_action_privateips(virtualdatacenter, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}//action/privateips",
            :accept   => "application/vnd.abiquo.privateips+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_action_privateips(virtualdatacenter, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
