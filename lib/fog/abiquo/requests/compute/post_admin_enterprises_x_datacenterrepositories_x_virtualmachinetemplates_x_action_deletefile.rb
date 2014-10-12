module Fog
  module Compute
    class Abiquo
      class Real
        def post_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x_action_deletefile(enterprise, datacenterrepository, virtualmachinetemplate)
          request(
            :expects  => [204],
            :method   => 'POST',
            :path     => "/admin/enterprises/#{enterprise}/datacenterrepositories/#{datacenterrepository}/virtualmachinetemplates/#{virtualmachinetemplate}/action/deletefile",
            :accept   => "*/*",
            :content  => "*/*"
          )
        end
      end

      class Mock
        def post_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x_action_deletefile(enterprise, datacenterrepository, virtualmachinetemplate)
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
