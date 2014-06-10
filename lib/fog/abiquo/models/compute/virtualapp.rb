module Fog
  module Compute
    class Abiquo
      class Virtualapp < Fog::Model
        identity  :id

        attribute :error
        attribute :highDisponibility
        attribute :name
        attribute :publicApp
        attribute :state
        
        attribute :links

        def reload
          requires :id
          mylnk = self.links.select {|l| l['rel'] == 'edit'}.first['href']
          service.get_virtualapp(mylnk)
        end
      end # Class vApp
    end # Class Abiquo
  end # module Compute
end # module Fog