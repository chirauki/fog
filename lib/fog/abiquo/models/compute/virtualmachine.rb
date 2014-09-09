module Fog
  module Compute
    class Abiquo
      class Virtualmachine < Fog::Compute::Abiquo::LinkModel
        identity  :id

        attribute :monitored
        attribute :name
        attribute :password
        attribute :ram
        attribute :state
        attribute :type
        attribute :uuid
        attribute :vdrpEnabled
        attribute :vdrpPort
        attribute :cpu
        attribute :hdInBytes
        attribute :highDisponibility
        attribute :idState
        attribute :idType
        attribute :keymap
        attribute :label

        attribute :enterprise_lnk
        attribute :enterprise_id
        attribute :user_lnk
        attribute :user_id
        attribute :virtualdatacenter_lnk
        attribute :virtualdatacenter_id
        attribute :virtualappliance_lnk
        attribute :virtualappliance_id
        attribute :metadata_lnk
        attribute :configurations_lnk
        attribute :nics_lnk
        attribute :harddisks_lnk
        attribute :state_lnk
        attribute :undeploy_lnk
        attribute :deploy_lnk
        attribute :reset_lnk
        attribute :instance_lnk
        attribute :rdpaccess_lnk
        attribute :tasks_lnk
        attribute :firewalls_lnk
        attribute :loadbalancers_lnk
        attribute :volumes_lnk
        attribute :virtualmachinetemplate_lnk
        attribute :virtualmachinetemplate_id
        attribute :category_lnk
        attribute :category_id

        def reload
          requires :id, :virtualappliance_id, :virtualdatacenter_id
          response = service.get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x(self.virtualdatacenter_id,
                                                                                      self.virtualappliance_id,
                                                                                      self.id)
          merge_attributes(response)
        end 

        def save
          requires :virtualmachinetemplate_lnk, :virtualappliance_id, :virtualdatacenter_id
          if self.id
            resp = service.put_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x(self.virtualdatacenter_id,
                                                        self.virtualappliance_id,
                                                        self.id,
                                                        self.to_json)
          else
            resp = service.post_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines(self.virtualdatacenter_id,
                                                        self.virtualappliance_id,
                                                        self.to_json)
          end
          merge_attributes(resp) unless resp.body.empty?
          reload if resp.body.empty?
        end

        def deploy
          requires :id, :virtualappliance_id, :virtualdatacenter_id
          service.post_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_action_deploy(self.virtualdatacenter_id,
                                                        self.virtualappliance_id,
                                                        self.id)
        end

        def delete
          requires :id, :virtualappliance_id, :virtualdatacenter_id
          service.delete.cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x(self.virtualdatacenter_id,
                                                                                      self.virtualappliance_id,
                                                                                      self.id)
        end
      end # Class VirtualMachine
    end # Class Abiquo
  end # module Compute
end # module Fog