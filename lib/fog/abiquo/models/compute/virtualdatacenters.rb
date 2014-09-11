require 'fog/core/collection'
require 'fog/abiquo/models/compute/virtualdatacenter'

module Fog
  module Compute
    class Abiquo
      class Virtualdatacenters < Fog::Collection
        model Fog::Compute::Abiquo::VirtualDatacenter

        def all(options = {})
          response = service.get_cloud_virtualdatacenters
          load(response)
        end

        def get(id)
          response = service.get_cloud_virtualdatacenters_x(id)
          new(response)
        end

        def where(args={})
          items = service.get_cloud_virtualdatacenters
          result_items = []

          return load(items) if args.empty?
          
          args.keys.each do |arg|
            result_items += items.select {|i| i[arg.to_s] == args[arg]}
          end
          load(result_items)
        end

        def create(name, location, hypervisor, net = {}, limits = {})
          object = new
          loc_lnk = location.url
          loc_lnk['rel'] = 'location'
          object.location_lnk = loc_lnk
          object.hypervisorType = hypervisor
          object.enterprise_lnk = service.enterprise if object.enterprise_lnk.nil?
          object.name = name

          # Network
          net_addr = net[:net_addr] ||  service.config_properties.select {|p| p['name'] == "client.network.defaultAddress" }.first['value']
          net_mask = net[:net_mask] ||  22 + service.config_properties.select {|p| p['name'] == "client.network.defaultNetmask" }.first['value'].to_i
          net_name = net[:net_name] ||  "fog_" + service.config_properties.select {|p| p['name'] == "client.network.defaultName" }.first['value']
          gw_addr = net[:gw_addr] || service.config_properties.select {|p| p['name'] == "client.network.defaultGateway" }.first['value']
          pri_dns = net[:pri_dns] || service.config_properties.select {|p| p['name'] == "client.network.defaultPrimaryDNS" }.first['value']
          sec_dns = net[:sec_dns] || service.config_properties.select {|p| p['name'] == "client.network.defaultSecondaryDNS" }.first['value']
          dns_suffix = net[:dns_suffix] || service.config_properties.select {|p| p['name'] == "client.network.defaultSufixDNS" }.first['value']

          object.vlan = {
              "address" => net_addr,
              "dhcpOptions" => {
                  "collection" => []
              },
              "gateway" => gw_addr,
              "mask" => net_mask,
              "name" => net_name,
              "primaryDNS" => pri_dns,
              "secondaryDNS" => sec_dns,
              "sufixDNS" => dns_suffix,
              "type"=> "INTERNAL"
            }

          # Limits
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
