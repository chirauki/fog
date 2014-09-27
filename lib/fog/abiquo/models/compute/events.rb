require 'fog/core/collection'
require 'fog/abiquo/models/compute/event.rb'

module Fog
  module Compute
    class Abiquo
      class Events < Fog::Collection
        model Fog::Compute::Abiquo::Event

        def all(options = {})
          response = service.get_events(options)
          load(response)
        end

        def get(id)
          response = service.get_events_x(id)
          new(response)
        end

        def where(args={})
          items = service.get_events(args)
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
