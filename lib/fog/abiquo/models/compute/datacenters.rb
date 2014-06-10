require 'fog/core/collection'
require 'fog/abiquo/models/compute/datacenter'

module Fog
  module Compute
    class Abiquo
      class Datacenters < Fog::Collection
        model Fog::Compute::Abiquo::Datacenter

        def all(options = {})
          response = service.list_datacenters(options)
          dcs_data = response["collection"] || []
          load(dcs_data)
        end

        def get(dc_id)
          response = service.get_datacenter(dc_id)
          datacenter_data = response
          new(datacenter_data)
        end
      end
    end
  end
end
