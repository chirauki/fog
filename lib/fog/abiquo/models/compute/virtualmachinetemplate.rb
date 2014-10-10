module Fog
  module Compute
    class Abiquo
      class VirtualMachineTemplate < Fog::Compute::Abiquo::LinkModel
        identity  :id

        attribute :name
        attribute :osType
        attribute :path
        attribute :ramRequired
        attribute :shared
        attribute :state
        attribute :chefEnabled
        attribute :cpuRequired
        attribute :creationDate
        attribute :creationUser
        attribute :description
        attribute :diskController
        attribute :diskControllerType
        attribute :diskFileSize
        attribute :diskFormatType
        attribute :hdRequired
        attribute :loginUser
        attribute :iconUrl

        attribute :url
        attribute :enterprise_lnk
        attribute :enterprise_id
        attribute :category_lnk
        attribute :category_id
        attribute :tasks_lnk
        attribute :datacenterrepository_lnk
        attribute :datacenterrepository_id
        attribute :conversions_lnk
        attribute :virtualmachines_lnk
        attribute :master_lnk
        attribute :master_id
        attribute :template_lnk
        attribute :diskfile_lnk
        attribute :instances_lnk
        attribute :templatedefinition_lnk

        def virtualmachines
          requires :id, :datacenterrepository_id, :enterprise_id
          resp = service.get_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x_action_virtualmachines(
                                                                                                    self.enterprise_id,
                                                                                                    self.datacenterrepository_id,
                                                                                                    self.id)
          Fog::Compute::Abiquo::Virtualmachines.new(:service => service).load(resp)
        end

        def set_unavailable
          requires :id, :datacenterrepository_id, :enterprise_id
          service.post_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x_action_deletefile(
                                                              self.enterprise_id,
                                                              self.datacenterrepository_id,
                                                              self.id)
          reload
        end

        def import
          requires :path
          self.save
        end

        def save
          requires :path, :name
          if self.id
            resp = service.put_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x(self.enterprise_id,
                                                              self.datacenterrepository_id,
                                                              self.id,
                                                              self.to_json)
          else
            resp = service.post_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates(self.enterprise_id,
                                                              self.datacenterrepository_id,
                                                              self.to_json)
          end
          merge_attributes(resp) unless resp.empty?
        end
      end # Class VirtualMachineTemplate
    end # Class Abiquo
  end # module Compute
end # module Fog