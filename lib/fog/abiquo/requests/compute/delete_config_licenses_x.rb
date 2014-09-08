module Fog
  module Compute
    class Abiquo
      class Real
        def delete_config_licenses_x(license, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => "/config/licenses/#{license}",
          )
        end
      end

      class Mock
        def delete_config_licenses_x(license, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
