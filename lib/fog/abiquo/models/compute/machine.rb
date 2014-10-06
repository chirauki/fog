module Fog
  module Compute
    class Abiquo
      class Machine < Fog::Compute::Abiquo::LinkModel
        identity  :id

        attribute :state
        attribute :type
        attribute :virtualCpuCores
        attribute :virtualCpusUsed
        attribute :virtualRamInMb
        attribute :virtualRamUsedInMb
        attribute :description
        attribute :initiatorIQN
        attribute :ip
        attribute :managerIp
        attribute :name

        attribute :url
        attribute :rack_lnk
        attribute :rack_id
        attribute :datacenter_id
        attribute :datastores_lnk
        attribute :refresh_lnk
        attribute :virtualmachines_lnk
        attribute :checkstate_lnk
        attribute :reenableafterha_lnk
        attribute :checkipmistate_lnk
        attribute :refreshnics_lnk
        attribute :sendmail_lnk
        attribute :networkInterfaces

        def datastores
          requires :id, :rack_id, :datacenter_id
          Fog::Compute::Abiquo::Datastores.new :service => service,
                                               :dc_id => self.datacenter_id,
                                               :rack_id => self.rack_id,
                                               :machine_id => self.id
        end

        def refresh
          requires :id, :rack_id, :datacenter_id
          service.get_admin_datacenters_x_racks_x_machines_x_datastores_action_refresh(self.datacenter_id,
                                                  self.rack_id,
                                                  self.id)
          reload
        end

        def virtualmachines(options = {})
          requires :id, :rack_id, :datacenter_id
          response = service.get_admin_datacenters_x_racks_x_machines_x_virtualmachines(self.datacenter_id,
                                                  self.rack_id,
                                                  self.id,
                                                  options)
          Fog::Compute::Abiquo::Virtualmachines.new( :service => service ).load(response)
        end

        def checkstate
          requires :id, :rack_id, :datacenter_id
          response = service.get_admin_datacenters_x_racks_x_machines_x_action_checkstate(self.datacenter_id,
                                                  self.rack_id,
                                                  self.id)
          response['state']
        end

        def reenableafterha
        end

        def checkipmistate
          requires :id, :rack_id, :datacenter_id
          response = service.get_admin_datacenters_x_racks_x_machines_x_action_checkipmistate(self.datacenter_id,
                                                  self.rack_id,
                                                  self.id)
          response['state']
        end

        def refreshnics
        end

        def sendmail
        end

        def initialize(attributes = {})
          super
          nichash = attributes['networkInterfaces']['collection']
          object if nichash.nil?

          nics_array = []
          nichash.each do |nic|
            nics_array << Fog::Compute::Abiquo::NetworkInterface.new(nic)
          end
          self.networkInterfaces = nics_array
        end

        def reload
          requires :id, :rack_id, :datacenter_id
          response = service.get_admin_datacenters_x_racks_x_machines_x(self.datacenter_id,
                                                                        self.rack_id,
                                                                        self.id)
          merge_attributes(response)
        end 

        def save
          requires :name, :ip
          if self.id
            resp = service.put_admin_datacenters_x_racks_x_machines_x(self.datacenter_id,
                                                                      self.rack_id,
                                                                      self.id,
                                                                      self.to_json)
          else
            resp = service.post_admin_datacenters_x_racks_x_machines_x(self.datacenter_id,
                                                                       self.rack_id,
                                                                       self.to_json)
          end
          merge_attributes(resp)
        end

        def destroy
          requires :id, :rack_id, :datacenter_id
          service.delete_admin_datacenters_x_racks_x_machines_x(self.datacenter_id,
                                                                self.rack_id,
                                                                self.id)
        end
      end # Class Machine
    end # Class Abiquo
  end # module Compute
end # module Fog