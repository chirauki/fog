require 'fog/core/collection'
require 'fog/abiquo/models/compute/virtualapp'

module Fog
  module Compute
    class Abiquo
      class Virtualapps < Fog::Collection
        model Fog::Compute::Abiquo::Virtualapp

        def all(options = {})
          vdc_id ||= attributes[:vdc_id]
          response = service.get_cloud_virtualdatacenters_x_virtualappliances(vdc_id)
          load(response)
        end

        def get(id)
          vdc_id ||= attributes[:vdc_id]
          response = service.get_cloud_virtualdatacenters_x_virtualappliances_x(vdc_id, id)
          new(response)
        end

        def where(args={})
          vdc_id ||= attributes[:vdc_id]
          items = service.get_cloud_virtualdatacenters_x_virtualappliances(vdc_id)
          result_items = []

          return load(items) if args.empty?
          
          args.keys.each do |arg|
            result_items += items.select {|i| i[arg.to_s] == args[arg]}
          end
          load(result_items)
        end

        def create(name)
          vdc_id ||= attributes[:vdc_id]
          object = new
          object.virtualdatacenter_id = vdc_id
          object.name = name
          object.save
          object
        end
      end
    end
  end
end
