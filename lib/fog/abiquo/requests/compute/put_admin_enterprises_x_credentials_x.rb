module Fog
  module Compute
    class Abiquo
      class Real
        def put_admin_enterprises_x_credentials_x(enterprise, credentials, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/admin/enterprises/#{enterprise}/credentials/#{credentials}",
            :accept   => "application/vnd.abiquo.publiccloudcredentials+json",
            :content  => "application/vnd.abiquo.publiccloudcredentials+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_admin_enterprises_x_credentials_x(enterprise, credentials, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
