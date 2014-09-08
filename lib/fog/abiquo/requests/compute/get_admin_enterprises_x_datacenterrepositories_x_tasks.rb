module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_datacenterrepositories_x_tasks(enterprise, datacenterrepository, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}/datacenterrepositories/#{datacenterrepository}//tasks",
            :accept   => "application/vnd.abiquo.tasks+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_datacenterrepositories_x_tasks(enterprise, datacenterrepository, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
