require 'fog/core/collection'
require 'fog/abiquo/models/compute/hardwareprofile'

module Fog
  module Compute
    class Abiquo
      class HardwareProfiles < Fog::Collection
        model Fog::Compute::Abiquo::HardwareProfile

        def all(options = {})
          location_id ||= attributes[:location_id]
          response = service.get_cloud_locations_x_hardwareprofiles(location_id)
          load(response)
        end

        def get(id)
          location_id ||= attributes[:location_id]
          response = service.get_cloud_locations_x_hardwareprofiles_x(id)
          new(response)
        end

        def where(args={})
          location_id ||= attributes[:location_id]
          items = service.get_cloud_locations_x_hardwareprofiles(location_id)
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
