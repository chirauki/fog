module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_datacenterrepositories_x_tasks_x(enterprise, datacenterrepository, id, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}/datacenterrepositories/#{datacenterrepository}//tasks/#{id}",
            :accept   => "application/vnd.abiquo.task+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_datacenterrepositories_x_tasks_x(enterprise, datacenterrepository, id, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
