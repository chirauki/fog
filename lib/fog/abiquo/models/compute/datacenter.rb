module Fog
  module Compute
    class Abiquo
      class Datacenter < Fog::Model
        identity  :id

        attribute :location
        attribute :name
        attribute :uuid

        attribute :links

        def racks
          @racks ||= Fog::Compute::Abiquo::Racks.new :racks_lnk => self.links.select {|l| l['rel'] == 'racks' }.first['href'] , :service => service
        end

        def remoteservices
          @remoteservices ||= Fog::Compute::Abiquo::RemoteServices.new :dc_lnk => self.links.select {|l| l['rel'] == 'remoteservices' }.first['href'] , :service => service
        end

        def delete
          requires :id
          mylnk = self.links.select {|l| l['rel'] == 'edit'}.first['href']
          service.delete_entity(mylnk)
        end
      end # Datacenter
    end # Abiquo
  end  # Compute
end # Fog