module Fog
  module Compute
    class Abiquo
      class VirtualDatacenter < Fog::Compute::Abiquo::LinkModel
        identity  :id

        attribute :name
        attribute :publicIpsHard
        attribute :publicIpsSoft
        attribute :ramHardLimitInMb
        attribute :ramSoftLimitInMb
        attribute :storageHardInMb
        attribute :storageSoftInMb
        attribute :vlansHard
        attribute :vlansSoft
        attribute :cpuCountHardLimit
        attribute :cpuCountSoftLimit
        attribute :diskHardLimitInMb
        attribute :diskSoftLimitInMb
        attribute :hypervisorType
        attribute :vlan

        attribute :url
        attribute :enterprise_lnk
        attribute :enterprise_id
        attribute :location_lnk
        attribute :location_id
        attribute :privatenetworks_lnk
        attribute :network_lnk
        attribute :virtualappliances_lnk
        attribute :defaultvlan_lnk
        attribute :privateips_lnk
        attribute :externalips_lnk
        attribute :unmanagedips_lnk
        attribute :defaultvlan_lnk
        attribute :volumes_lnk
        attribute :disks_lnk
        attribute :topurchase_lnk
        attribute :purchased_lnk
        attribute :statefulcandidates_lnk
        attribute :tiers_lnk
        attribute :templates_lnk
        attribute :virtualmachines_lnk
        attribute :firewalls_lnk
        attribute :loadbalancers_lnk
        attribute :region_lnk

        def reload
          requires :id
          response = service.get_cloud_virtualdatacenters_x(self.id)
          merge_attributes(response)
        end

        def save
          requires :name, :hypervisorType, :enterprise_lnk, :location_lnk
          if self.id
            resp = service.put_cloud_virtualdatancenters_x(self.id,
                                                          self.to_json)
          else
            resp = service.post_cloud_virtualdatacenters(self.to_json)
          end
          merge_attributes(resp)
        end

        def delete
          requires :id
          service.delete_cloud_virtualdatacenters_x(self.id)
        end

        def virtualappliances
          requires :id
          @virtualapps ||= Fog::Compute::Abiquo::VirtualAppliances.new :vdc_id => self.id, :service => service
        end

        def templates
          @virtualmahinetemplates ||= Fog::Compute::Abiquo::VirtualMachineTemplates.new :vdc_id => self.id, :service => service
        end
      end # Class VDC
    end # Class Abiquo
  end # module Compute
end # module Fog