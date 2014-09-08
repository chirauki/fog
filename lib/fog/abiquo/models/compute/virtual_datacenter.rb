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
        attribute :firewalls_lnk
        attribute :location_lnk

        def reload
          requires :id
          service.get(self.url, 'application/vnd.abiquo.virtualdatacenter+json')
        end

        def save
          requires :name, :hypervisorType, :enterprise_lnk, :location_lnk
          if self.id
            resp = service.put(self.url.href,
                              'application/vnd.abiquo.virtualdatacenter+json',
                              self.to_json )
            merge_attributes(resp.body)
          else
            resp = service.post('/cloud/virtualdatacenters',
                                'application/vnd.abiquo.virtualdatacenter+json',
                                self.to_json)
            merge_attributes(resp)
          end
        end

        def delete
          service.delete(self.url['href'])
        end

        def virtualapps
          requires :id
          @virtualapps ||= Fog::Compute::Abiquo::Virtualapps.new :vapps_lnk => self.virtualappliances_lnk, :service => service
        end
      end # Class VDC
    end # Class Abiquo
  end # module Compute
end # module Fog