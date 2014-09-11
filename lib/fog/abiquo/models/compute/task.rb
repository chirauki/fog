module Fog
  module Compute
    class Abiquo
      class Task < Fog::Compute::Abiquo::LinkModel
        identity :taskId

        attribute :creationTimestamp
        attribute :ownerId
        attribute :state
        attribute :timestamp
        attribute :type
        attribute :userId
        attribute :jobs

        attribute :url
        attribute :parent_lnk
        attribute :acknowledge_lnk
        attribute :user_lnk
        attribute :user_id
        attribute :virtualmachine_lnk
        attribute :virtualmachine_id

        def reload
          requires :taskId, :url, :ownerId

          vm_href = self.url['href']
          vdc_id = vm_href.match(/virtualdatacenters\/(\d+)\//).captures.first.to_i
          vapp_id = vm_href.match(/virtualappliances\/(\d+)\//).captures.first.to_i
          
          response = service.get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_tasks_x(vdc_id,
                                                                                      vapp_id,
                                                                                      self.ownerId,
                                                                                      self.taskId)
          merge_attributes(response)
        end 
      end # Class Task
    end # Class Abiquo
  end # module Compute
end # module Fog