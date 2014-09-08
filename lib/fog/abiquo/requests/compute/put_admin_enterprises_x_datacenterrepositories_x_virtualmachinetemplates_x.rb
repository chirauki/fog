module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x(enterprise, datacenterrepository, virtualmachinetemplate, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/enterprises/#{enterprise}/datacenterrepositories/#{datacenterrepository}/virtualmachinetemplates/#{virtualmachinetemplate}",
            :accept   => "application/vnd.abiquo.virtualmachinetemplate+json",
            :content  => "application/vnd.abiquo.virtualmachinetemplate+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x(enterprise, datacenterrepository, virtualmachinetemplate, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
