require 'fog/core/collection'
require 'fog/abiquo/models/compute/virtualmachine'

module Fog
  module Compute
    class Abiquo
      class EnterpriseVirtualmachines < Fog::Collection
        model Fog::Compute::Abiquo::Virtualmachine

        def all(options = {})
          enterprise_id ||= attributes[:enterprise_id]
          response = service.get_admin_enterprises_x_action_virtualmachines(enterprise_id)
          load(response)
        end

        def where(args={})
          enterprise_id ||= attributes[:enterprise_id]
          items = service.get_admin_enterprises_x_action_virtualmachines(enterprise_id)
          result_items = []

          return load(items) if args.empty?
          
          args.keys.each do |arg|
            result_items += items.select {|i| i[arg.to_s] == args[arg]}
          end
          load(result_items)
        end
      end
    end
  end
end
