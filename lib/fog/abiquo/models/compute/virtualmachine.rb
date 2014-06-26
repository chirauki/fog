module Fog
  module Compute
    class Abiquo
      class Virtualmachine < Fog::Model
        identity  :id

        attribute :uuid
        attribute :vdrpPort
        attribute :state
        attribute :password
        attribute :metadata
        attribute :idState
        attribute :idType
        attribute :cpu
        attribute :name
        attribute :highDisponibility
        attribute :keymap
        attribute :hdInBytes
        attribute :label
        attribute :vdrpEnabled
        attribute :type
        attribute :ram

        attribute :links

        def reload
          requires :id
          mylnk = self.links.select {|l| l['rel'] == 'edit'}.first['href']
          service.get_virtualapp(mylnk)
        end # method reload

        def virtualmachines
          requires :id
          @virtualvms ||= Fog::Compute::Abiquo::Virtualvms.new :vms_lnk => self.links.select {|l| l['rel'] == 'virtualmachines' }.first['href'], :service => service 
        end # method virtualmachines
        
      end # Class vApp
    end # Class Abiquo
  end # module Compute
end # module Fog