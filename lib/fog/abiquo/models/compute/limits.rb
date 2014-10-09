require 'fog/core/collection'
require 'fog/abiquo/models/compute/limit'

module Fog
  module Compute
    class Abiquo
      class Limits < Fog::Collection
        model Fog::Compute::Abiquo::Limit

        def all(options = {})
          @enterprise_id ||= attributes[:enterprise_id]
          response = service.get_admin_enterprises_x_limits(@enterprise_id)
          load(response)
        end

        def get(id)
          @enterprise_id ||= attributes[:enterprise_id]
          response = service.get_admin_enterprises_x_limits_x(@enterprise_id, id)
          new(response)
        end

        def destroy(id)
          @enterprise_id ||= attributes[:enterprise_id]
          object = new(:id => id,
                       :enterprise_id => @enterprise_id)
          object.destroy
        end

        def where(args={})
          @enterprise_id ||= attributes[:enterprise_id]
          items = service.get_admin_enterprises_x_limits(@enterprise_id)
          result_items = []

          return load(items) if args.empty?
          
          args.keys.each do |arg|
            result_items += items.select {|i| i[arg.to_s] == args[arg]}
          end
          load(result_items)
        end

        def create(args = {})
          @enterprise_id ||= attributes[:enterprise_id]

          location_lnk = args.delete(:location).url
          location_lnk['rel'] = 'location'

          object = new(args)
          object.enterprise_id = @enterprise_id
          object.location_lnk = location_lnk
          object.save
          object
        end
      end
    end
  end
end
