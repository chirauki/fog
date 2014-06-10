require 'fog/core/collection'
require 'fog/abiquo/models/compute/virtualdatacenter'

module Fog
  module Compute
    class Abiquo
      class Virtualdatacenters < Fog::Collection
        model Fog::Compute::Abiquo::VirtualDatacenter

        def all(options = {})
          response = service.list_virtualdatacenters(options)
          vdcs_data = response["collection"] || []
          load(vdcs_data)
        end

        def get(vdc_id)
          response = service.get_virtualdatacenter(vdc_id)
          virtualdatacenter_data = response
          new(virtualdatacenter_data)
        end
      end
    end
  end
end
