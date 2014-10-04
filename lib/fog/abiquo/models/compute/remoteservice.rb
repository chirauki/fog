module Fog
  module Compute
    class Abiquo
      class RemoteService < Fog::Compute::Abiquo::LinkModel
        identity  :id

        attribute :status
        attribute :type
        attribute :uri

        attribute :url
        attribute :datacenter_lnk
        attribute :datacenter_id
        attribute :check_lnk

        def check
          requires :check_lnk
          typecheck = self.url['href'].split('/').last
          service.get_admin_datacenters_x_remoteservices_x_action_check(self.datacenter_id,
                                                                        typecheck)
          reload
        end

        def reload
          requires :id, :url, :datacenter_id
          typecheck = self.url['href'].split('/').last
          response = service.get_admin_datacenters_x_remoteservices_x(self.datacenter_id, typecheck)
          merge_attributes(response)
        end

        def save
          requires :type, :uri, :datacenter_id
          if self.id
            type = self.url['href'].split('/').last
            resp = service.put_admin_datacenters_x_remoteservices_x(self.datacenter_id,
                                                                    type,
                                                                    self.to_json)
          else
            resp = service.post_admin_datacenters_x_remoteservices(self.datacenter_id,
                                                                   self.to_json)
          end
          merge_attributes(resp)
        end
      end # RemoteService
    end # Abiquo
  end  # Compute
end # Fog