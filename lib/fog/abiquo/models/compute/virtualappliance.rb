module Fog
  module Compute
    class Abiquo
      class VirtualAppliance < Fog::Compute::Abiquo::LinkModel
        identity  :id

        attribute :error
        attribute :highDisponibility
        attribute :name
        attribute :publicApp
        attribute :state

        attribute :url

        attribute :virtualdatacenter_lnk
        attribute :virtualdatacenter_id
        attribute :enterprise_lnk
        attribute :enterprise_id
        attribute :virtualmachines_lnk
        attribute :state_lnk
        attribute :undeploy_lnk
        attribute :deploy_lnk
        attribute :price_lnk
        attribute :layers_lnk

        def deploy
          requires :id, :virtualdatacenter_id
          resp = service.post_cloud_virtualdatacenters_x_virtualappliances_x_action_deploy(self.virtualdatacenter_id,
                                                                                           self.id)
          tasks = []
          resp['links'].each do |task|
            vm_id = task['href'].match(/virtualmachines\/(\d+)\//)[1]
            task_id = task['href'].split('/').last
            tasks << Fog::Compute::Abiquo::Tasks.new(:service => service,
                                                     :vdc_id => self.virtualdatacenter_id,
                                                     :vapp_id => self.id,
                                                     :vm_id => vm_id).get(task_id)
          end
          tasks
        end

        def undeploy
          requires :id, :virtualdatacenter_id
          resp = service.post_cloud_virtualdatacenters_x_virtualappliances_x_action_undeploy(self.virtualdatacenter_id,
                                                                                             self.id)
          tasks = []
          resp['links'].each do |task|
            vm_id = task['href'].match(/virtualmachines\/(\d+)\//)[1]
            task_id = task['href'].split('/').last
            tasks << Fog::Compute::Abiquo::Tasks.new(:service => service,
                                                     :vdc_id => self.virtualdatacenter_id,
                                                     :vapp_id => self.id,
                                                     :vm_id => vm_id).get(task_id)
          end
          tasks
        end

        def save
          requires :name
          if self.id
            resp = service.put_cloud_virtualdatancenters_x_virtualappliances_x(self.virtualdatacenter_id,
                                                                               self.id,
                                                                               self.to_json)
          else
            resp = service.post_cloud_virtualdatacenters_x_virtualappliances(self.virtualdatacenter_id,
                                                                             self.to_json)
          end
          merge_attributes(resp)
        end

        def virtualmachines
          requires :id, :virtualdatacenter_id
          @virtualmachines ||= Fog::Compute::Abiquo::Virtualmachines.new :vdc_id => self.virtualdatacenter_id,
            :vapp_id => self.id,
            :service => service
        end # method virtualmachines
      end # Class vApp
    end # Class Abiquo
  end # module Compute
end # module Fog
