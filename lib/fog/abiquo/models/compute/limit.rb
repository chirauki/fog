module Fog
  module Compute
    class Abiquo
      class Limit < Fog::Compute::Abiquo::LinkModel
        identity  :id

        attribute :cpuCountHardLimit
        attribute :cpuCountSoftLimit
        attribute :diskHardLimitInMb
        attribute :diskSoftLimitInMb
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
        
        attribute :url
        attribute :enterprise_lnk
        attribute :enterprise_id
        attribute :hypervisors_lnk
        attribute :externalnetworks_lnk
        attribute :location_lnk
        attribute :location_id

        def location
          requires :id
          case self.location_lnk['type']
          when 'application/vnd.abiquo.datacenter+json'
            Fog::Compute::Abiquo::Datacenters.new(:service => service).get(self.location_id)
          when 'application/vnd.abiquo.publiccloudregion+json'
            Fog::Compute::Abiquo::Publiccloudregions.new(:service => service).get(self.location_id)
          end
        end

        def save
          requires :location_lnk, :enterprise_id
          if self.id
            resp = service.put_admin_enterprises_x_limits_x(self.enterprise_id,
                                                           self.id,
                                                           self.to_json)
          else
            resp = service.post_admin_enterprises_x_limits(self.enterprise_id,
                                                          self.to_json)
          end
          merge_attributes(resp)
        end

        def destroy
          requires :id, :enterprise_id
          service.delete_admin_enterprises_x_limits_x(self.enterprise_id, self.id)
        end
      end # Class Limit
    end # Class Abiquo
  end # module Compute
end # module Fog