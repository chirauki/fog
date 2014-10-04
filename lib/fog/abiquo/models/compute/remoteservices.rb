require 'fog/core/collection'
require 'fog/abiquo/models/compute/remoteservice'
require 'json'

module Fog
  module Compute
    class Abiquo
      class RemoteServices < Fog::Collection
        model Fog::Compute::Abiquo::RemoteService

        def all(args = {})
          dc_id ||= attributes[:dc_id]
          response = service.get_admin_datacenters_x_remoteservices(dc_id)
          load(response)
        end

        def get(rs_type)
          dc_id ||= attributes[:dc_id]
          response = service.get_admin_datacenters_x_remoteservices_x(dc_id, rs_type)
          new(response)
        end

        def where(args = {})
          dc_id ||= attributes[:dc_id]
          items = service.get_admin_datacenters_x_remoteservices(dc_id)
          result_items = []

          return load(items) if args.empty?
          
          args.keys.each do |arg|
            result_items += items.select {|i| i[arg.to_s] == args[arg]}
          end
          load(result_items)
        end

        def create(args = {})
          dc_id ||= attributes[:dc_id]

          object = new(args)
          object.datacenter_id = dc_id
          object.save
          object
        end
      end
    end
  end
end
