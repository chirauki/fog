module Fog
  module Compute
    class Abiquo
      class Rack < Fog::Compute::Abiquo::LinkModel
        identity  :id

        attribute :haEnabled
        attribute :name
        attribute :nrsq
        attribute :vlanIdMax
        attribute :vlanIdMin
        attribute :vlanPerVdcReserved
        
        attribute :url
        attribute :machines_lnk
        attribute :datacenter_lnk
        attribute :datacenter_id

        def datacenter
          Fog::Compute::Abiquo::Datacenters.new(:service => service).get(datacenter_id)
        end

        def machines
          Fog::Compute::Abiquo::Machines.new :service => service,
                                             :dc_id => self.datacenter_id,
                                             :rack_id => self.id
        end

        def save
          requires :name, :datacenter_id
          if self.id
            resp = service.put_admin_datacenters_x_racks_x(self.datacenter_id,
                                                           self.id,
                                                           self.to_json)
          else
            resp = service.post_admin_datacenters_x_racks(self.datacenter_id,
                                                          self.to_json)
          end
          merge_attributes(resp)
        end

        def destroy
          requires :id, :datacenter_id
          service.delete_admin_datacenters_x_racks_x(self.datacenter_id, self.id)
        end
      end # Class vApp
    end # Class Abiquo
  end # module Compute
end # module Fog