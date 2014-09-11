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
          requires :id, :url
          type = self.url['type']
          
          if type.include? "datacenter"
            hyps = service.get_admin_datacenters_x_hypervisors(self.id)
            ([].push hyps.map {|h| h['name'] }).flatten!
          elsif type.include? "publiccloudregion"
            hyptype_href = self.links.select {|l| l['rel'].eql? "hypervisortype" }.first['href']
            [].push hyptype_href.split('/').last
          end
        end

        def hardwareprofiles
          requires :id, :url

          return nil if self.url['type'].include? "datacenter"

          Fog::Compute::Abiquo::HardwareProfiles.new :location_id => self.id, 
                                                     :service => service
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