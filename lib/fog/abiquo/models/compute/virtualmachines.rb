require 'fog/core/collection'
require 'fog/abiquo/models/compute/virtualmachine'

module Fog
  module Compute
    class Abiquo
      class Virtualmachines < Fog::Collection
        model Fog::Compute::Abiquo::Virtualmachine

        def all(options = {})
          @virtualmachines_lnk ||= attributes[:virtualmachines_lnk]
          response = service.list_virtualmachines(@virtualmachines_lnk)
          virtualmachines_data = response["collection"] || []
          load(virtualmachines_data)
        end

        def get(virtualmachine_id)
          @virtualmachines_lnk ||= attributes[:virtualmachines_lnk]
          response = service.get_virtualmachine(:virtualmachines_lnk => @virtualmachines_lnk, :vapp_id => vapp_id)
          virtualmachine_data = response
          new(virtualmachine_data)
        end
      end
    end
  end
end
