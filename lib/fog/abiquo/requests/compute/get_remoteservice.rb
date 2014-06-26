module Fog
  module Compute
    class Abiquo
      class Real
        def get_remoteservice(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "#{options[:dc_lnk]}/#{options[:rs_type].downcase}",
            :accept   => 'application/vnd.abiquo.remoteservice+json'
          )
        end
      end

      class Mock
        def get_remoteservice
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
