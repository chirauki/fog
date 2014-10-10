module Fog
  module Compute
    class Abiquo
      class Real
        def post_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates(enterprise, datacenterrepository, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/admin/enterprises/#{enterprise}/datacenterrepositories/#{datacenterrepository}/virtualmachinetemplates",
            :accept   => "application/vnd.abiquo.virtualmachinetemplate+json",
            :content  => "application/vnd.abiquo.virtualmachinetemplate+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates(enterprise, datacenterrepository, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
