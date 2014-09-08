module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x_conversions_x(enterprise, datacenterrepository, virtualmachinetemplate, conversion, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/enterprises/#{enterprise}/datacenterrepositories/#{datacenterrepository}/virtualmachinetemplates/#{virtualmachinetemplate}/conversions/#{conversion}",
            :accept   => "application/vnd.abiquo.acceptedrequest+json",
            :content  => "application/vnd.abiquo.conversion+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x_conversions_x(enterprise, datacenterrepository, virtualmachinetemplate, conversion, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
