require 'fog/core/collection'
require 'fog/abiquo/models/compute/nic'

module Fog
  module Compute
    class Abiquo
      class Nics < Fog::Collection
        model Fog::Compute::Abiquo::Nic

        def all(options = {})
          vdc_id ||= attributes[:vdc_id]
          vapp_id ||= attributes[:vapp_id]
          vm_id ||= attributes[:vm_id]
          response = service.get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_network_nics(vdc_id, vapp_id, vm_id)
          load(response)
        end

        def get(id)
          vdc_id ||= attributes[:vdc_id]
          vapp_id ||= attributes[:vapp_id]
          vm_id ||= attributes[:vm_id]
          response = service.get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_network_nics_x(vdc_id, vapp_id, vm_id, id)
          new(response)
        end

        def where(args={})
          vdc_id ||= attributes[:vdc_id]
          vapp_id ||= attributes[:vapp_id]
          vm_id ||= attributes[:vm_id]
          items = service.get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_network_nics(vdc_id, vapp_id, vm_id)
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
