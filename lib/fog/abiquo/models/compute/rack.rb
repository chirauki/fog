module Fog
  module Compute
    class Abiquo
      class Rack < Fog::Model
        identity  :id

        attribute :haEnabled
        attribute :name
        attribute :nrsq
        attribute :vlanIdMax
        attribute :vlanIdMin
        attribute :vlanPerVdcReserved

        attribute :datacenter_lnk
        attribute :machines_lnk
        attribute :url
        
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

        def initialize(attributes)
          prepare_service_value(attributes)
          service.parse_links(attributes)
          super
        end # initialize


      end # Class vApp
    end # Class Abiquo
  end # module Compute
end # module Fog