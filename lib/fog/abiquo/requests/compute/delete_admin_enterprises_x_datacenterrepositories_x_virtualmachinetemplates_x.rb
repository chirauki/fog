module Fog
  module Compute
    class Abiquo
      class Real
        def delete_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x(enterprise, datacenterrepository, virtualmachinetemplate, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/admin/enterprises/#{enterprise}/datacenterrepositories/#{datacenterrepository}/virtualmachinetemplates/#{virtualmachinetemplate}",
          )
        end
      end

      class Mock
        def delete_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x(enterprise, datacenterrepository, virtualmachinetemplate, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
