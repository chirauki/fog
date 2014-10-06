require 'fog/core/collection'
require 'fog/abiquo/models/compute/volume'

module Fog
  module Compute
    class Abiquo
      class Volumes < Fog::Collection
        model Fog::Compute::Abiquo::Volume

        def all(options = {})
          vdc_id ||= attributes[:vdc_id]
          vapp_id ||= attributes[:vapp_id]
          vm_id ||= attributes[:vm_id]
          response = service.get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_storage_volumes(vdc_id, vapp_id, vm_id)
          load(response)
        end

        def get(id)
          vdc_id ||= attributes[:vdc_id]
          vapp_id ||= attributes[:vapp_id]
          vm_id ||= attributes[:vm_id]
          response = service.get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_storage_volumes_x(vdc_id, vapp_id, vm_id, id)
          new(response)
        end

        def where(args={})
          vdc_id ||= attributes[:vdc_id]
          vapp_id ||= attributes[:vapp_id]
          vm_id ||= attributes[:vm_id]
          items = service.get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_storage_volumes(vdc_id, vapp_id, vm_id)
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