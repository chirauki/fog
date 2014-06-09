module Fog
  module Compute
    class Abiquo
      class Real
        def list_virtualdatacenters(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => '/cloud/virtualdatacenters'
          )
        end
      end

      class Mock
        def list_servers
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "status" => "OK",
            "droplets"  => self.data[:servers]
          }
          response
        end
      end
    end
  end
end
