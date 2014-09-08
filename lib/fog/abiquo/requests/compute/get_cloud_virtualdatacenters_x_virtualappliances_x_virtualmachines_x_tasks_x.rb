module Fog
  module Compute
    class Abiquo
      class Real
        def get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_tasks_x(virtualdatacenter, virtualappliance, virtualmachine, id, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/virtualappliances/#{virtualappliance}/virtualmachines/#{virtualmachine}//tasks/#{id}",
            :accept   => "application/vnd.abiquo.task+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_tasks_x(virtualdatacenter, virtualappliance, virtualmachine, id, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
