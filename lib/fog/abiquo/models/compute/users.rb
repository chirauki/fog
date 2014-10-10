require 'fog/core/collection'
require 'fog/abiquo/models/compute/user'

module Fog
  module Compute
    class Abiquo
      class Users < Fog::Collection
        model Fog::Compute::Abiquo::User

        def all(options = {})
          @enterprise_id ||= attributes[:enterprise_id]
          response = service.get_admin_enterprises_x_users(@enterprise_id, options)
          load(response)
        end

        def get(id)
          @enterprise_id ||= attributes[:enterprise_id]
          response = service.get_admin_enterprises_x_users_x(@enterprise_id, id)
          new(response)
        end

        def where(args={}, options = {})
          @enterprise_id ||= attributes[:enterprise_id]
          items = service.get_admin_enterprises_x_users(@enterprise_id, options)
          result_items = []

          return load(items) if args.empty?
          
          args.keys.each do |arg|
            result_items += items.select {|i| i[arg.to_s] == args[arg]}
          end
          load(result_items)
        end

        def destroy(id)
          @enterprise_id ||= attributes[:enterprise_id]
          service.delete_admin_enterprises_x_users_x(@enterprise_id, id)
        end

        def create(args = {})
          @enterprise_id ||= attributes[:enterprise_id]

          role_lnk = args.delete(:role).url
          role_lnk['rel'] = 'role'

          object = new(args)
          object.enterprise_id = @enterprise_id
          object.role_lnk = role_lnk
          object.save
          object
        end
      end
    end
  end
end
