require 'fog/core/collection'
require 'fog/abiquo/models/compute/virtualapp'

module Fog
  module Compute
    class Abiquo
      class Virtualapps < Fog::Collection
        model Fog::Compute::Abiquo::Virtualapp

        def all(options = {})
          @vapps_lnk ||= attributes[:vapps_lnk]
          response = service.get(@vapps_lnk['href'], @vapps_lnk['type'])
          vapps_data = response["collection"] || []
          load(vapps_data)
        end

        def get(vapp_id)
          @vapp_lnk ||= attributes[:vapp_lnk]
          response = service.get(@vapps_lnk['href'], @vapps_lnk['type'])
          virtualappliance_data = response
          new(virtualappliance_data)
        end

        def create(name)
          @vapps_lnk ||= attributes[:vapps_lnk]
          params = { :name => name }
          response = service.post(@vapps_lnk['href'],
                                  'application/vnd.abiquo.virtualappliance+json',
                                  Fog::JSON.encode(params))
        end
      end
    end
  end
end
