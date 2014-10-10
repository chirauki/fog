require 'fog/core/collection'
require 'fog/abiquo/models/compute/role'

module Fog
  module Compute
    class Abiquo
      class Roles < Fog::Collection
        model Fog::Compute::Abiquo::Role

        def all(options = {})
          response = service.get_admin_roles(options)
          load(response)
        end

        def get(id)
          response = service.get_admin_roles_x(id)
          new(response)
        end

        def where(args={})
          items = service.get_admin_roles
          result_items = []

          return load(items) if args.empty?
          
          args.keys.each do |arg|
            result_items += items.select {|i| i[arg.to_s] == args[arg]}
          end
          load(result_items)
        end

        def create(args = {})
          object = new(args)
          object.save
          object
        end
      end
    end
  end
end
