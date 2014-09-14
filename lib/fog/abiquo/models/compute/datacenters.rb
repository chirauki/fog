require 'fog/core/collection'
require 'fog/abiquo/models/compute/datacenter'

module Fog
  module Compute
    class Abiquo
      class Datacenters < Fog::Collection
        model Fog::Compute::Abiquo::Datacenter

        def all(options = {})
          response = service.get_admin_datacenters
          load(response)
        end

        def get(id)
          response = service.get_admin_datacenters_x(id)
          new(response)
        end

        def where(args={})
          items = service.get_admin_datacenters
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
