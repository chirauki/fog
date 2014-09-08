module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x_tasks_x(enterprise, datacenterrepository, virtualmachinetemplate, id, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}/datacenterrepositories/#{datacenterrepository}/virtualmachinetemplates/#{virtualmachinetemplate}//tasks/#{id}",
            :accept   => "application/vnd.abiquo.task+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x_tasks_x(enterprise, datacenterrepository, virtualmachinetemplate, id, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
