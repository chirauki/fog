module Fog
  module Compute
    class Abiquo
      class Virtualmachine < Fog::Compute::Abiquo::LinkServer
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

        attribute :public_ip_address
        attribute :private_ip_address

        attribute :url
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
        attribute :network_configuration_lnk
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
        attribute :conversion_lnk
        attribute :category_lnk
        attribute :category_id
        attribute :sendmail_lnk
        attribute :location_lnk
        attribute :location_id
        attribute :machine_lnk
        attribute :machine_id
        attribute :hardwareprofile_lnk
        attribute :hardwareprofile_id

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
          merge_attributes(resp) unless resp.empty?
          reload if resp.empty?
        end

        def tasks
          requires :id, :virtualappliance_id, :virtualdatacenter_id
          Fog::Compute::Abiquo::Tasks.new :vdc_id => self.virtualdatacenter_id, 
                                                :vapp_id => self.virtualappliance_id,
                                                :vm_id => self.id,
                                                :service => service
        end

        def volumes
          requires :id, :virtualappliance_id, :virtualdatacenter_id
          Fog::Compute::Abiquo::Volumes.new :vdc_id => self.virtualdatacenter_id, 
                                            :vapp_id => self.virtualappliance_id,
                                            :vm_id => self.id,
                                            :service => service
        end

        def deploy
          requires :id, :virtualappliance_id, :virtualdatacenter_id
          response = service.post_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_action_deploy(self.virtualdatacenter_id,
                                                        self.virtualappliance_id,
                                                        self.id)
          task_lnk = response['links'].select {|l| l['rel'].eql? "status" }.first['href']
          task_lnk.split('/').last
        end

        def undeploy
          requires :id, :virtualappliance_id, :virtualdatacenter_id
          response = service.post_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_action_undeploy(self.virtualdatacenter_id,
                                                        self.virtualappliance_id,
                                                        self.id,
                                                        self.to_json)
          task_lnk = response['links'].select {|l| l['rel'].eql? "status" }.first['href']
          task_lnk.split('/').last
        end

        def nics
          requires :id, :virtualdatacenter_id, :virtualappliance_id
          Fog::Compute::Abiquo::Nics.new :service => service,
                                         :vdc_id  => self.virtualdatacenter_id,
                                         :vapp_id => self.virtualappliance_id,
                                         :vm_id   => self.id
        end

        def public_ip_address
          requires :id, :virtualdatacenter_id, :virtualappliance_id
          
          nics = self.nics
          if nics.select {|n| self.is_public_ip? n.ip }.first.nil?
            nil
          else
            nics.select {|n| self.is_public_ip? n.ip }.first.ip
          end
        end

        def private_ip_address
          requires :id, :virtualdatacenter_id, :virtualappliance_id
          
          nics = self.nics
          if nics.select {|n| not self.is_public_ip? n.ip }.first.nil?
            nil
          else
            nics.select {|n| not self.is_public_ip? n.ip }.first.ip
          end
        end

        def delete
          requires :id, :virtualappliance_id, :virtualdatacenter_id
          service.delete_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x(self.virtualdatacenter_id,
                                                                                      self.virtualappliance_id,
                                                                                      self.id)
        end

        def ready?
          self.state == 'ON'
        end

        def is_public_ip?(ip)
          publicip = false
          bytes = ip.split(".")
          if bytes[0].to_i != 10 and bytes[0].to_i != 172 and bytes[0].to_i != 192
            publicip = true
          elsif bytes[0].to_i == 172 and not bytes[1].to_i.between?(16, 31)
            publicip = true
          elsif bytes[0].to_i == 192 and not bytes[1].to_i == 168
            publicip = true
          end
          publicip
        end
      end # Class VirtualMachine
    end # Class Abiquo
  end # module Compute
end # module Fog