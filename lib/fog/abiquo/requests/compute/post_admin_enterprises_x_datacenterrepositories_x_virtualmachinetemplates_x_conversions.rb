module Fog
  module Compute
    class Abiquo
      class Real
        def post_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x_conversions(enterprise, datacenterrepository, virtualmachinetemplate, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/admin/enterprises/#{enterprise}/datacenterrepositories/#{datacenterrepository}/virtualmachinetemplates/#{virtualmachinetemplate}/conversions",
            :accept   => "application/vnd.abiquo.conversions+json",
            :content  => "*/*",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x_conversions(enterprise, datacenterrepository, virtualmachinetemplate, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
