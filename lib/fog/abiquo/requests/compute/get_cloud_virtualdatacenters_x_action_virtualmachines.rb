module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_action_virtualmachines(virtualdatacenter, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/action/virtualmachines",
            :accept   => "application/vnd.abiquo.virtualmachines+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_action_virtualmachines(virtualdatacenter, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
