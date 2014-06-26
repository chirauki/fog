module Fog
  module Compute
    class Abiquo
      class Real
        def create_virtualdatacenter(options = {})
          data = {
            'name'  => options[:name],
            'links' => options[:links]
          }

          request(
            :expects  => [201],
            :method   => 'POST',
            :path     => '/cloud/virtualdatacenters',
            :accept   => 'application/vnd.abiquo.virtualdatacenter+json',
            :content  => 'application/vnd.abiquo.virtualdatacenter+json',
            :body     => Fog::JSON.encode(data)
          )
        end
      end

      class Mock
        def create_virtualdatacenter
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
