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
          locations += response["collection"]
          response = service.get_cloud_locations_pcr
          locations += response["collection"]
          binding.pry
          load(locations)
        end

        def get(dc_id)
          response = service.get_admin_datacenters_x(dc_id)
          datacenter_data = response
          new(datacenter_data)
        end
      end
    end
  end
end
