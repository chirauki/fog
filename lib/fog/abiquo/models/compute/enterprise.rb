module Fog
  module Compute
    class Abiquo
      class Enterprise < Fog::Compute::Abiquo::LinkModel
        identity :id

        attribute :name
        attribute :publicIpsHard
        attribute :publicIpsSoft
        attribute :ramHardLimitInMb
        attribute :ramSoftLimitInMb
        attribute :repositoryHardInMb
        attribute :repositorySoftInMb
        attribute :storageHardInMb
        attribute :storageSoftInMb
        attribute :vlansHard
        attribute :vlansSoft
        attribute :workflow
        attribute :cpuCountHardLimit
        attribute :cpuCountSoftLimit
        attribute :diskHardLimitInMb
        attribute :diskSoftLimitInMb
        attribute :isReservationRestricted

        attribute :url
        attribute :users_lnk
        attribute :properties_lnk
        attribute :appslib_templateDefinitionLists_lnk
        attribute :appslib_templateDefinitions_lnk
        attribute :datacenterrepositories_lnk
        attribute :virtualmachines_lnk
        attribute :virtualappliances_lnk
        attribute :ips_lnk
        attribute :cloud_virtualdatacenters_lnk
        attribute :reservedmachines_lnk
        attribute :limits_lnk
        attribute :volumes_lnk
        attribute :externalnetworks_lnk
        attribute :pendingtasks_lnk
        attribute :credentials_lnk

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

        def datacenterrepositories
          requires :id
          Fog::Compute::Abiquo::DatacenterRepositories.new :service => service, :enterprise_id => self.id
        end

        def limits
          requires :id
          Fog::Compute::Abiquo::Limits.new :service => service, :enterprise_id => self.id
        end

        def delete
          requires :id
          service.delete_admin_enterprises_x(self.id)
        end

        def reload
          requires :id
          response = service.get_admin_enterprises_x(self.id)
          merge_attributes(response)
        end 

        def credentials
          requires :id
          Fog::Compute::Abiquo::PublicCloudCredentials.new :enterprise_id => self.id, :service => self.service
        end

        def virtualmachines
          requires :id
          Fog::Compute::Abiquo::EnterpriseVirtualmachines.new :enterprise_id => self.id, :service => self.service
        end
      end # Class Enterprise
    end # Class Abiquo
  end # module Compute
end # module Fog