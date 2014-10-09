module Fog
  module Compute
    class Abiquo
      class PublicCloudCredential < Fog::Compute::Abiquo::LinkModel
        identity :id

        attribute :access
        attribute :key
        
        attribute :url
        attribute :enterprise_lnk
        attribute :enterprise_id
        attribute :hypervisortype_lnk

        def save
          requires :access, :key
          if self.id
            resp = service.put_admin_enterprises_x_credentials_x(self.enterprise_id,
                                                    self.id,
                                                    self.to_json)
          else
            resp = service.post_admin_enterprises_x_credentials(self.enterprise_id,
                                                    self.to_json)
          end
          merge_attributes(resp)
          reload
        end
      end # Class PublicCloudCredential
    end # Class Abiquo
  end # module Compute
end # module Fog