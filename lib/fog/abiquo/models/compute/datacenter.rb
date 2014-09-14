module Fog
  module Compute
    class Abiquo
      class Datacenter < Fog::Compute::Abiquo::LinkModel
        identity  :id

        attribute :location
        attribute :name
        attribute :uuid

        attribute :racks_lnk
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

        def save
          requires :name
          if self.id
            resp = service.put_admin_enterprises_x(self.id,
                                                   self.to_json)
          else
            resp = service.post_admin_enterprises(self.to_json)
          end
          merge_attributes(resp)
        end

        def delete
          requires :id
          service.delete_admin_enterprises_x(self.id)
        end
      end # Datacenter
    end # Abiquo
  end  # Compute
end # Fog