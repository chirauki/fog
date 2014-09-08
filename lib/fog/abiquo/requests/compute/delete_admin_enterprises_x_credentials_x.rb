module Fog
  module Compute
    class Abiquo
      class Real
        def delete_admin_enterprises_x_credentials_x(enterprise, credentials, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/admin/enterprises/#{enterprise}/credentials/#{credentials}",
          )
        end
      end

      class Mock
        def delete_admin_enterprises_x_credentials_x(enterprise, credentials, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
