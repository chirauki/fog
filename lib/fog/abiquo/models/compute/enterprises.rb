require 'fog/core/collection'
require 'fog/abiquo/models/compute/enterprise'

module Fog
  module Compute
    class Abiquo
      class Enterprises < Fog::Collection
        model Fog::Compute::Abiquo::Enterprise

        def all(options = {})
          response = service.get_admin_enterprises || []
          load(response)
        end

        def get(id)
          response = service.get_admin_enterprises_x(id)
          new(response)
        end

        def where(args={})
          items = service.get_admin_enterprises
          result_items = []

          return load(items) if args.empty?
          
          args.keys.each do |arg|
            result_items += items.select {|i| i[arg.to_s] == args[arg]}
          end
          load(result_items)
        end

        def create(name, limits = {})
          object = new
          object.name = name
          
          object.cpuCountHardLimit = limits[:cpuCountHardLimit] || 0
          object.cpuCountSoftLimit = limits[:cpuCountSoftLimit] || 0
          object.diskHardLimitInMb = limits[:diskHardLimitInMb] || 0
          object.diskSoftLimitInMb = limits[:diskSoftLimitInMb] || 0
          object.publicIpsHard = limits[:publicIpsHard] || 0
          object.publicIpsSoft = limits[:publicIpsSoft] || 0
          object.ramHardLimitInMb = limits[:ramHardLimitInMb] || 0
          object.ramSoftLimitInMb = limits[:ramSoftLimitInMb] || 0
          object.storageHardInMb = limits[:storageHardInMb] || 0
          object.storageSoftInMb = limits[:storageSoftInMb] || 0
          object.vlansHard = limits[:vlansHard] || 0

          object.save
          object
        end
      end
    end
  end
end
