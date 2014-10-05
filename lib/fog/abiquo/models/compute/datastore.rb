module Fog
  module Compute
    class Abiquo
      class Datastore < Fog::Compute::Abiquo::LinkModel
        identity  :id

        attribute :datastoreUUID
        attribute :directory
        attribute :enabled
        attribute :name
        attribute :rootPath
        attribute :size
        attribute :usedSize

        attribute :url
        attribute :datacenter_id
        attribute :rack_id
        attribute :machine_id

        def reload
          requires :id, :machine_id, :rack_id, :datacenter_id
          response = service.get_admin_datacenters_x_racks_x_machines_x_datastores_x(self.datacenter_id,
                                                                        self.rack_id,
                                                                        self.machine_id,
                                                                        self.id)
          merge_attributes(response)
        end 

        def save
          requires :name
          if self.id
            resp = service.put_admin_datacenters_x_racks_x_machines_x_datastores_x(self.datacenter_id,
                                                                      self.rack_id,
                                                                      self.machine_id,
                                                                      self.id,
                                                                      self.to_json)
          else
            resp = service.post_admin_datacenters_x_racks_x_machines_x_datastores(self.datacenter_id,
                                                                       self.rack_id,
                                                                       self.machine_id,
                                                                       self.to_json)
          end
          merge_attributes(resp)
        end

        def destroy
          requires :id, :machine_id, :rack_id, :datacenter_id
          service.delete_admin_datacenters_x_racks_x_machines_x_datastores(self.datacenter_id,
                                                                self.rack_id,
                                                                self.machine_id,
                                                                self.id)
        end
      end # Class Datastore
    end # Class Abiquo
  end # module Compute
end # module Fog