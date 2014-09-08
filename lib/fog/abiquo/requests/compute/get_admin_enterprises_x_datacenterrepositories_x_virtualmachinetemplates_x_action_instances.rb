module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x_action_instances(enterprise, datacenterrepository, virtualmachinetemplate, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}/datacenterrepositories/#{datacenterrepository}/virtualmachinetemplates/#{virtualmachinetemplate}/action/instances",
            :accept   => "application/vnd.abiquo.virtualmachinetemplates+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x_action_instances(enterprise, datacenterrepository, virtualmachinetemplate, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
