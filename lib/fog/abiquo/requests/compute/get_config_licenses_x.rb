module Fog
  module Compute
    class Abiquo
      class Real
        def get_config_licenses_x(license, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/config/licenses/#{license}",
            :accept   => "application/vnd.abiquo.license+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_config_licenses_x(license, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
