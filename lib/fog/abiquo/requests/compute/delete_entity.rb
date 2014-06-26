module Fog
  module Compute
    class Abiquo
      class Real
        def delete_entity(entity_lnk, options = {})
          request(
            :expects  => [204],
            :method   => 'DELETE',
            :path     => entity_lnk
          )
        end
      end

      class Mock
        def delete_entity
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
