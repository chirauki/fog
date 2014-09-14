require 'fog/core/collection'
require 'fog/abiquo/models/compute/publiccloudregion'

module Fog
  module Compute
    class Abiquo
      class PublicCloudRegions < Fog::Collection
        model Fog::Compute::Abiquo::PublicCloudRegion

        def all(options = {})
          response = service.get_admin_publiccloudregions
          load(response)
        end

        def get(id)
          response = service.get_admin_publiccloudregions_x(id)
          new(response)
        end

        def where(args={})
          items = service.get_admin_publiccloudregions
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
