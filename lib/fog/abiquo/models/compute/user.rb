module Fog
  module Compute
    class Abiquo
      class User < Fog::Compute::Abiquo::LinkModel
        identity :id

        attribute :active
        attribute :authType
        attribute :email
        attribute :locale
        attribute :name
        attribute :nick
        attribute :publicSshKey
        attribute :surname

        attribute :url
        attribute :enterprise_lnk
        attribute :enterprise_id
        attribute :role_lnk
        attribute :role_id
        attribute :virtualmachines_lnk
        attribute :pendingtasks_lnk
        attribute :applications_lnk

        def save
          requires :enterprise_id
          if self.id
            resp = service.put_admin_enterprises_x_users_x(self.enterprise_id,
                                                    self.id,
                                                    self.to_json)
          else
            resp = service.post_admin_enterprises_x_users(self.enterprise_id,
                                                    self.to_json)
          end
          merge_attributes(resp)
        end
      end # Class User
    end # Class Abiquo
  end # module Compute
end # module Fog