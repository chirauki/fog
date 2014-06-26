require 'fog/core/collection'
require 'fog/abiquo/models/compute/remoteservice'
require 'json'

module Fog
  module Compute
    class Abiquo
      class RemoteServices < Fog::Collection
        model Fog::Compute::Abiquo::RemoteService

        def all(options = {})
          @dc_lnk ||= attributes[:dc_lnk]
          response = service.list_remoteservices(@dc_lnk)
          remoteservices_data = response["collection"] || []
          load(remoteservices_data)
        end

        def get(rs_type)
          @dc_lnk ||= attributes[:dc_lnk]
          response = service.get_remoteservice(:dc_lnk => @dc_lnk, :rs_type => rs_type)
          remoteservice_data = response
          new(remoteservice_data)
        end

        def create(options = {})
          @dc_lnk ||= attributes[:dc_lnk]
          resp = service.create_remoteservice(@dc_lnk, options.to_json)
          remoteservice_data = resp
          new(remoteservice_data)
        end
      end
    end
  end
end
