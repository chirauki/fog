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
      end # Class VirtualMachineTemplate
    end # Class Abiquo
  end # module Compute
end # module Fog