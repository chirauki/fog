require 'fog/core/collection'
require 'fog/abiquo/models/compute/virtualapp'

module Fog
  module Compute
    class Abiquo
      class Virtualapps < Fog::Collection
        model Fog::Compute::Abiquo::Virtualapp

        def all(options = {})
          @vapps_lnk ||= attributes[:vapps_lnk]
          response = service.list_virtualapps(@vapps_lnk)
          vapps_data = response["collection"] || []
          load(vapps_data)
        end

        def get(vapp_id)
          @vapps_lnk ||= attributes[:vapps_lnk]
          response = service.get_virtualapp(:vapps_lnk => @vapps_lnk, :vapp_id => vapp_id)
          virtualdatacenter_data = response
          new(virtualdatacenter_data)
        end
      end
    end
  end
end
