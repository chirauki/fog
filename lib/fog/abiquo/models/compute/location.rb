module Fog
  module Compute
    class Abiquo
      class Location < Fog::Compute::Abiquo::LinkModel
        identity  :id

        attribute :location
        attribute :name
        attribute :uuid

        attribute :url
        attribute :links

        def hypervisors
          hypervisors_lnk = self.links.select {|l| l['rel'] == "hypervisors" }.first
          hyps = service.get_admin_datacenters_x_hypervisors(self.id)["collection"]

          ([].push hyps.map {|h| h['name'] }).flatten!
        end

        def delete
          requires :id
          selflnk = self.links.select {|l| l['rel'] == 'edit'}.first['href']
          service.delete(selflnk)
        end
      end # Datacenter
    end # Abiquo
  end  # Compute
end # Fog