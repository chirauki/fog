require 'fog/core/collection'
require 'fog/abiquo/models/compute/rack'
require 'json'

module Fog
  module Compute
    class Abiquo
      class Racks < Fog::Collection
        model Fog::Compute::Abiquo::Rack

        def all(options = {})
          @racks_lnk ||= attributes[:racks_lnk]
          response = service.list_racks(@racks_lnk)
          racks_data = response["collection"] || []
          load(racks_data)
        end

        def get(rack_id)
          @racks_lnk ||= attributes[:racks_lnk]
          response = service.get_rack(:racks_lnk => @racks_lnk, :rack_id => rack_id)
          rack_data = response
          new(rack_data)
        end

        def create(options = {})
          @racks_lnk ||= attributes[:racks_lnk]
          resp = service.create_rack(@racks_lnk, options.to_json)
          rack_data = resp
          new(rack_data)
        end
      end
    end
  end
end
