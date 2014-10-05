require 'fog/core/collection'
require 'fog/abiquo/models/compute/datastore'

module Fog
  module Compute
    class Abiquo
      class Datastores < Fog::Collection
        model Fog::Compute::Abiquo::Datastore

        def all(options = {})
          @dc_id ||= attributes[:dc_id]
          @rack_id ||= attributes[:rack_id]
          @machine_id ||= attributes[:machine_id]
          response = service.get_admin_datacenters_x_racks_x_machines_x_datastores(@dc_id, @rack_id, @machine_id)
          response.map {|m| m['datacenter_id'] = @dc_id}
          response.map {|m| m['rack_id'] = @rack_id}
          response.map {|m| m['machine_id'] = @machine_id}
          load(response)
        end

        def get(id)
          @dc_id ||= attributes[:dc_id]
          @rack_id ||= attributes[:rack_id]
          @machine_id ||= attributes[:machine_id]
          response = service.get_admin_datacenters_x_racks_x_machines_x(@dc_id, @rack_id, id)
          response['datacenter_id'] = @dc_id
          response['datacenter_id'] = @dc_id
          response['rack_id'] = @rack_id
          response['machine_id'] = @machine_id
          new(response)
        end

        def where(args={})
          @dc_id ||= attributes[:dc_id]
          @rack_id ||= attributes[:rack_id]
          @machine_id ||= attributes[:machine_id]
          items = service.get_admin_datacenters_x_racks_x_machines(@dc_id, @rack_id)
          result_items = []

          return load(items) if args.empty?
          
          args.keys.each do |arg|
            result_items += items.select {|i| i[arg.to_s] == args[arg]}
          end
          result_items.map {|m| m['datacenter_id'] = @dc_id}
          result_items.map {|m| m['rack_id'] = @rack_id}
          result_items.map {|m| m['machine_id'] = @machine_id}
          load(result_items)
        end

        def create(args = {})
          @dc_id ||= attributes[:dc_id]
          @rack_id ||= attributes[:rack_id]
          @machine_id ||= attributes[:machine_id]
          object = new(args)
          object.datacenter_id = @dc_id
          object.rack_id = @rack_id
          object.machine_id = @machine_id
          object.save
          object
        end
      end
    end
  end
end
