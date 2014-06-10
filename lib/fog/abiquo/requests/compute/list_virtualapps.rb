module Fog
  module Compute
    class Abiquo
      class Real
        def list_virtualapps(vapps_lnk, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => vapps_lnk,
            :accept  => 'application/vnd.abiquo.virtualappliances+json'
          )
        end
      end

      class Mock
        def list_virtualapps(vdc_id, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
