module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_credentials(enterprise, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}/credentials",
            :accept   => "application/vnd.abiquo.publiccloudcredentialslist+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_credentials(enterprise, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
