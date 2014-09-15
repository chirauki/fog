require 'fog/core/collection'
require 'fog/abiquo/models/compute/location'

module Fog
  module Compute
    class Abiquo
      class Locations < Fog::Collection
        model Fog::Compute::Abiquo::Location

        def all(options = {})
          locations = []
          response = service.get_cloud_locations
          locations += response
          response = service.get_cloud_locations_pcr
          locations += response
          load(locations)
        end

        def get(id)
          response = nil
          begin
            response = service.get_cloud_locations_x(id)
          rescue Fog::Compute::Abiquo::Error
            response = service.get_cloud_locations_pcr_x(id)
          end
          new(response)
        end

        def where(args={})
          items = []
          response = service.get_cloud_locations
          items += response
          response = service.get_cloud_locations_pcr
          items += response
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
