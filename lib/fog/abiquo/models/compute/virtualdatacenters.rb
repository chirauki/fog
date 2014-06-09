require 'fog/core/collection'
require 'fog/abiquo/models/compute/virtualdatacenter'

module Fog
  module Compute
    class Abiquo
      class VirtualDatacenters < Fog::Collection
        model Fog::Compute::Abiquo::VirtualDatacenter

        def all(options = {})
          response = service.list_virtualdatacenters(options)
          vdcs_data = response["collection"]["VirtualDatacenter"] || []
          load(vdcs_data)
        end

        def get(vdc_id)
          response = service.list_virtualdatacenters('id' => vdc_id)
          virtualdatacenter_data = response["collection"]["virtualdatacenter"].first
          new(virtualdatacenter_data)
        end
      end
    end
  end
end
