module Fog
  module Compute
    class Abiquo
      class Real
        def create_virtualdatacenter(options = {})
          request(
            :expects  => [200],
            :method   => 'POST',
            :path     => '/cloud/virtualdatacenters' % vdc_id,
            :accept   => 'application/vnd.abiquo.virtualdatacenter+json',
            :content  => 'application/vnd.abiquo.virtualdatacenter+json',
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
