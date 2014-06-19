module Fog
  module Compute
    class Abiquo
      class Rack < Fog::Model
        identity  :id

        attribute :haEnabled
        attribute :name
        attribute :nsrq
        attribute :vlanIdMax
        attribute :vlanIdMin
        attribute :vlanPerVdcReserved
        attribute :datacenter
        
        attribute :links

        def reload
          requires :id
          mylnk = self.links.select {|l| l['rel'] == 'datacenter'}.first['href']
          service.get_rack(mylnk, self.id)
        end

        def delete
          requires :id
          mylnk = self.links.select {|l| l['rel'] == 'edit'}.first['href']
          service.delete_rack(mylnk)
        end

        #abq.racks.create( :name => 'foo', :datacenter => dc )
        #abq.racks.create( :name => 'tessxtfog1', :datacenter => dc, :haEnabled => true, :nrsq => 1, :vlanIdMax => 100, :vlanIdMin => 8, :vlanPerVdcReserved => 15 )
        def save
          requires :name, :datacenter
          data = service.create_rack(attributes)
          merge_attributes(data)
          true
        end

        
      end # Class vApp
    end # Class Abiquo
  end # module Compute
end # module Fog