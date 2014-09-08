module Fog
  module Compute
    class Abiquo
      class Real
        def post_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_tasks_x_action_continue(virtualdatacenter, virtualappliance, virtualmachine, id, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/virtualappliances/#{virtualappliance}/virtualmachines/#{virtualmachine}//tasks/#{id}/action/continue",
            :accept   => "*/*",
            :content  => "*/*",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_tasks_x_action_continue(virtualdatacenter, virtualappliance, virtualmachine, id, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
