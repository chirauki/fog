module Fog
  module Compute
    class Abiquo
      class Real
        def get_virtualapp(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "#{options[:vapps_lnk]}/#{options[:vapp_id]}",
            :accept   => 'application/vnd.abiquo.virtualappliance+json'
          )
        end
      end

      class Mock
        def get_virtualapp
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
