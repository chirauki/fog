module Fog
  module Compute
    class Abiquo
      class Role < Fog::Compute::Abiquo::LinkModel
        identity :id

        attribute :name
        attribute :blocked

        attribute :url
        attribute :privileges_lnk
        attribute :scope_lnk
        attribute :scope_id

        def save
          requires :name
          if self.id
            resp = service.put_admin_roles_x(self.id,
                                            self.to_json)
          else
            resp = service.post_admin_roles(self.to_json)
          end
          merge_attributes(resp)
        end
      end # Class Role
    end # Class Abiquo
  end # module Compute
end # module Fog