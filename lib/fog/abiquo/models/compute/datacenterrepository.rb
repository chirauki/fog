module Fog
  module Compute
    class Abiquo
      class DatacenterRepository < Fog::Compute::Abiquo::LinkModel
        identity  :id

        attribute :name
        attribute :repositoryLocation
        
        attribute :url
        attribute :enterprise_lnk
        attribute :enterprise_id
        attribute :virtualmachinetemplates_lnk
        attribute :refresh_lnk
        attribute :tasks_lnk
        attribute :datacenter_lnk
        attribute :datacenter_id
        attribute :applianceManagerRepositoryUri_lnk
        attribute :applianceManagerRepositoryUri_id

        def initialize(attributes = {})
          super
          self.id = self.url['href'].split('/').last.to_i if self.url
        end

        def virtualmachinetemplates
          requires :id, :enterprise_id
          Fog::Compute::Abiquo::AdminVirtualMachineTemplates.new(:service => service,
                                                                 :enterprise_id => self.enterprise_id,
                                                                 :repo_id => self.id).load(resp)
        end

        def save
          requires :name, :enterprise_id
          if self.id
            resp = service.put_admin_enterprises_x_datacenterrepositories_x(self.enterprise_id,
                                                           self.id,
                                                           self.to_json)
          else
            resp = service.post_admin_enterprises_x_datacenterrepositories(self.enterprise_id,
                                                          self.to_json)
          end
          merge_attributes(resp)
        end

        def destroy
          requires :id, :enterprise_id
          service.delete_admin_enterprises_x_limits_x(self.enterprise_id, self.id)
        end
      end # Class DatacenterRepository
    end # Class Abiquo
  end # module Compute
end # module Fog