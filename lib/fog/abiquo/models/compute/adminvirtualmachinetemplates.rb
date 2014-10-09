require 'fog/core/collection'
require 'fog/abiquo/models/compute/virtualmachinetemplate.rb'

module Fog
  module Compute
    class Abiquo
      class AdminVirtualMachineTemplates < Fog::Collection
        model Fog::Compute::Abiquo::VirtualMachineTemplate

        def all(options = {})
          @enterprise_id ||= attributes[:enterprise_id]
          @repo_id ||= attributes[:repo_id]
          response = service.get_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates(@enterprise_id, @repo_id)
          load(response)
        end

        def get(id)
          @enterprise_id ||= attributes[:enterprise_id]
          @repo_id ||= attributes[:repo_id]
          response = service.get_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x(
                                @enterprise_id, @repo_id, id)
          new(response)
        end

        def where(args={})
          @enterprise_id ||= attributes[:enterprise_id]
          @repo_id ||= attributes[:repo_id]
          items = service.get_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates(@enterprise_id, @repo_id)
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
