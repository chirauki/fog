module Fog
  module Compute
    class Abiquo
      class PublicCloudCredential < Fog::Compute::Abiquo::LinkModel
        identity :id

        attribute :access
        attribute :identity
        
        attribute :url
        attribute :enterprise_lnk
        attribute :enterprise_id
        attribute :hypervisortype_lnk

        def save
          requires :access, :identity
          if self.id
            resp = service.put_admin_enterprises_x_credentials_x(self.enterprise_id,
                                                    self.id,
                                                    self.to_json)
          else
            resp = service.post_admin_enterprises_x_credentials(self.enterprise_id,
                                                    self.to_json)
          end
          merge_attributes(resp)
        end

        def delete
          requires :id
          service.delete_admin_enterprises_x(self.id)
        end
        
        def reload
          requires :id
          response = service.get_admin_enterprises_x_credentials_x(self.enterprise_id,
                                                                   self.id)
          merge_attributes(response)
        end 
      end # Class PublicCloudCredential
    end # Class Abiquo
  end # module Compute
end # module Fog