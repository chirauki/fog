require 'fog/core/collection'
require 'fog/abiquo/models/compute/datacenterrepository'

module Fog
  module Compute
    class Abiquo
      class DatacenterRepositories < Fog::Collection
        model Fog::Compute::Abiquo::DatacenterRepository

        def all(options = {})
          @enterprise_id ||= attributes[:enterprise_id]
          response = service.get_admin_enterprises_x_datacenterrepositories(@enterprise_id, options)
          load(response)
        end

        def get(id)
          @enterprise_id ||= attributes[:enterprise_id]
          response = service.get_admin_enterprises_x_datacenterrepositories_x(@enterprise_id, id)
          new(response)
        end

        def destroy(id)
          @enterprise_id ||= attributes[:enterprise_id]
          object = new(:id => id,
                       :enterprise_id => @enterprise_id)
          object.destroy
        end

        def where(args={}, options={})
          @enterprise_id ||= attributes[:enterprise_id]
          items = service.get_admin_enterprises_x_datacenterrepositories(@enterprise_id, options)
          result_items = []

          return load(items) if args.empty?
          
          args.keys.each do |arg|
            result_items += items.select {|i| i[arg.to_s] == args[arg]}
          end
          load(result_items)
        end

        def create(args = {})
          @enterprise_id ||= attributes[:enterprise_id]
          object = new(args)
          object.enterprise_id = @enterprise_id
          object.save
          object
        end
      end
    end
  end
end
