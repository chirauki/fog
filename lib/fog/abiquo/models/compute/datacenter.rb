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

      end # Datacenter
    end # Abiquo
  end  # Compute
end # Fog