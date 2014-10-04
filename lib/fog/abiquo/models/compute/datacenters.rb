require 'fog/core/collection'
require 'fog/abiquo/models/compute/datacenter'

module Fog
  module Compute
    class Abiquo
      class Datacenters < Fog::Collection
        model Fog::Compute::Abiquo::Datacenter

        def all(options = {})
          response = service.get_admin_datacenters
          load(response)
        end

        def get(id)
          response = service.get_admin_datacenters_x(id)
          new(response)
        end

        def where(args = {})
          items = service.get_admin_datacenters
          result_items = []

          return load(items) if args.empty?
          
          args.keys.each do |arg|
            result_items += items.select {|i| i[arg.to_s] == args[arg]}
          end
          load(result_items)
        end

        def create(args = {})
          object = new(args)
          object.save

          if args.keys.include? :remoteservices
            datacenter_ip = args[:remoteservices]
            rs_types = { "VIRTUAL_FACTORY" => "http://%ip%:8009/virtualfactory",
                        "VIRTUAL_SYSTEM_MONITOR" => "http://%ip%:8009/vsm",
                        "APPLIANCE_MANAGER" => "http://%ip%:8009/am",
                        "NODE_COLLECTOR" => "http://%ip%:8009/nodecollector",
                        "STORAGE_SYSTEM_MONITOR" => "http://%ip%:8009/ssm",
                        "BPM_SERVICE" => "http://%ip%:8009/bpm-async",
                        "DHCP_SERVICE" => "omapi://%ip%:7911/",
                        "DHCPv6" => "omapi://%ip%:7911/" }
            rs_types.keys.each do |rs_type|
              object.remoteservices.create(:type => rs_type,
                                           :uri => rs_types[rs_type].gsub("%ip%", datacenter_ip))
            end
          end
          object
        end
      end
    end
  end
end
