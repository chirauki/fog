require 'fog/core/collection'
require 'fog/abiquo/models/compute/rack'

module Fog
  module Compute
    class Abiquo
      class Racks < Fog::Collection
        model Fog::Compute::Abiquo::Rack

        def all(options = {})
          @dc_id ||= attributes[:dc_id]
          response = service.get_admin_datacenters_x_racks(@dc_id)
          load(response)
        end

        def get(id)
          @dc_id ||= attributes[:dc_id]
          response = service.get_admin_datacenters_x_racks_x(@dc_id, id)
          new(response)
        end

        def destroy(id)
          @dc_id ||= attributes[:dc_id]
          object = new(:id => id,
                       :datacenter_id => @dc_id)
          object.destroy
        end

        def where(args={})
          @dc_id ||= attributes[:dc_id]
          items = service.get_admin_datacenters_x_racks(@dc_id)
          result_items = []

          return load(items) if args.empty?
          
          args.keys.each do |arg|
            result_items += items.select {|i| i[arg.to_s] == args[arg]}
          end
          load(result_items)
        end

        def create(args = {})
          @dc_id ||= attributes[:dc_id]
          object = new(args)
          object.datacenter_id = @dc_id
          object.save
          object
        end
      end
    end
  end
end
