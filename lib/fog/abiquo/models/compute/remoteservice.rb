module Fog
  module Compute
    class Abiquo
      class RemoteService < Fog::Model
        identity  :id

        attribute :status
        attribute :type
        attribute :uri

        attribute :links

        def check
          rs_check = self.links.select {|l| l['rel'] == 'check'}
          if not rs_check.nil? 
            rs_check_uri = rs_check.first['href']
            service.check_remoteservice(rs_check_uri)
          else
            "RS of type #{self.type} cannot be checked."
          end
        end

        def delete
          requires :id
          mylnk = self.links.select {|l| l['rel'] == 'edit'}.first['href']
          service.delete_entity(mylnk)
        end
      end # RemoteService
    end # Abiquo
  end  # Compute
end # Fog