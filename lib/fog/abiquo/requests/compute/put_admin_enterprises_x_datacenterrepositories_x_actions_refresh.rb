module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_enterprises_x_datacenterrepositories_x_actions_refresh(enterprise, datacenterrepository, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/enterprises/#{enterprise}/datacenterrepositories/#{datacenterrepository}//actions/refresh",
            :accept   => "application/vnd.abiquo.acceptedrequest+json",
            :content  => "*/*",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_enterprises_x_datacenterrepositories_x_actions_refresh(enterprise, datacenterrepository, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
