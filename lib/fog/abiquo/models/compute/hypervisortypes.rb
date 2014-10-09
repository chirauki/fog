require 'fog/core/collection'
require 'fog/abiquo/models/compute/hypervisortype'

module Fog
  module Compute
    class Abiquo
      class Hypervisortypes < Fog::Collection
        model Fog::Compute::Abiquo::Hypervisortype

        def all(options = {})
          response = service.get_config_hypervisortypes
          load(response)
        end

        def get(id)
          response = service.get_config_hypervisortypes_x(id)
          new(response)
        end

        def where(args = {})
          items = service.get_config_hypervisortypes
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
