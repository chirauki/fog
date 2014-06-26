require 'fog/core/collection'
require 'fog/abiquo/models/compute/datacenter'

module Fog
  module Compute
    class Abiquo
      class Datacenters < Fog::Collection
        model Fog::Compute::Abiquo::Datacenter

        def all(options = {})
          response = service.list_datacenters(options)
          datacenters_data = response["collection"] || []
          load(datacenters_data)
        end

        def get(dc_id)
          response = service.get_datacenter(dc_id)
          datacenter_data = response
          new(datacenter_data)
        end

        def create(options = {})
          response = service.create_datacenter(options.to_json)
          datacenter_data = response
          new(datacenter_data)
        end
      end
    end
  end
end
