require 'fog/core/collection'
require 'fog/abiquo/models/compute/virtualmachine'

module Fog
  module Compute
    class Abiquo
      class Virtualmachines < Fog::Collection
        model Fog::Compute::Abiquo::Virtualmachine

        def all(options = {})
          vdc_id ||= attributes[:vdc_id]
          vapp_id ||= attributes[:vapp_id]
          response = service.get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines(vdc_id, vapp_id)
          load(response)
        end

        def get(id)
          vdc_id ||= attributes[:vdc_id]
          vapp_id ||= attributes[:vapp_id]
          response = service.get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x(vdc_id, vapp_id, id)
          new(response)
        end

        def where(args={})
          vdc_id ||= attributes[:vdc_id]
          vapp_id ||= attributes[:vapp_id]
          items = service.get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines(vdc_id, vapp_id)
          result_items = []

          return load(items) if args.empty?
          
          args.keys.each do |arg|
            result_items += items.select {|i| i[arg.to_s] == args[arg]}
          end
          load(result_items)
        end

        def create(template, params={})
          vdc_id ||= attributes[:vdc_id]
          vapp_id ||= attributes[:vapp_id]
          
          template_lnk = template.url
          template_lnk['rel'] = 'virtualmachinetemplate'
          object = new
          object.virtualdatacenter_id = vdc_id
          object.virtualappliance_id = vapp_id
          object.virtualmachinetemplate_lnk = template_lnk

          vdc = service.virtualdatacenters.get(vdc_id)
          if vdc.region_lnk.nil?
            object.cpu = params[:cpu] if not params[:cpu].nil?
            object.ram = params[:ram] if not params[:ram].nil?
          else
            raise "Missing hardwareprofile param." if params[:hardwareprofile].nil?
            hwproflnk = params[:hardwareprofile].url
            hwproflnk['rel'] = 'hardwareprofile'
            object.hardwareprofile_lnk = hwproflnk
          end
            
          object.save
          object
        end
      end
    end
  end
end
