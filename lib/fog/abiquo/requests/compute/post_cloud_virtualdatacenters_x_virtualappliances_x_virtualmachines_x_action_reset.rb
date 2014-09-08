module Fog
  module Compute
    class Abiquo
      class Real
        def post_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_action_reset(virtualdatacenter, virtualappliance, virtualmachine, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/virtualappliances/#{virtualappliance}/virtualmachines/#{virtualmachine}/action/reset",
            :accept   => "application/vnd.abiquo.acceptedrequest+json",
            :content  => "*/*",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_action_reset(virtualdatacenter, virtualappliance, virtualmachine, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
