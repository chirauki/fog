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

        def hypervisors
          requires :id, :url
          hyps = service.get_admin_datacenters_x_hypervisors(self.id)
          ([].push hyps.map {|h| h['name'] }).flatten!
        end

        def racks
          Fog::Compute::Abiquo::Racks.new :service => service, :dc_id => self.id
        end

        def backups
        end

        def updateusedresources
          requires :id
          service.put_admin_datacenters_x_action_updateusedresources(self.id)
          reload
        end

        def hypervisors
        end

        def enterprises
        end

        def discover
        end

        def checkmachinestate
        end

        def checkmachineipmistate
        end

        def tiers
        end

        def devices
        end

        def networkservicetypes
        end

        def network
        end

        def getLimits
        end
        
        def remoteservices
          Fog::Compute::Abiquo::RemoteServices.new :service => service,
                                                   :dc_id => self.id
        end

        def save
          requires :name, :location
          if self.id
            resp = service.put_admin_datacenters_x(self.id,
                                                   self.to_json)
          else
            resp = service.post_admin_datacenters(self.to_json)
          end
          merge_attributes(resp)
        end

        def destroy
          requires :id
          service.delete_admin_datacenters_x(self.id)
        end

      end # Datacenter
    end # Abiquo
  end  # Compute
end # Fog