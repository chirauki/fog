module Fog
  module Compute
    class Abiquo
      class Datacenter < Fog::Model
        identity  :id

        attribute :location
        attribute :name
        attribute :uuid

        attribute :url
        attribute :remoteservices_lnk
        attribute :backups_lnk
        attribute :updateusedresources_lnk
        attribute :hypervisors_lnk
        attribute :enterprises_lnk
        attribute :discover_lnk
        attribute :checkmachinestate_lnk
        attribute :checkmachineipmistate_lnk
        attribute :tiers_lnk
        attribute :devices_lnk
        attribute :networkservicetypes_lnk
        attribute :network_lnk 
        attribute :getLimits_lnk

        attribute :links

        def racks
          @racks ||= Fog::Compute::Abiquo::Racks.new :racks_lnk => self.links.select {|l| l['rel'] == 'racks' }.first['href'] , :service => service
        end

        def initialize(attributes)
          prepare_service_value(attributes)
          service.parse_links(attributes)
          super
        end


      end # Datacenter
    end # Abiquo
  end  # Compute
end # Fog
