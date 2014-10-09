module Fog
  module Compute
    class Abiquo
      class Publiccloudregion < Fog::Compute::Abiquo::LinkModel
        identity  :id

        attribute :name
        attribute :uuid

        attribute :url
        attribute :enterprises_lnk
        attribute :remoteservices_lnk
        attribute :hypervisortype_lnk
        attribute :region_lnk

        def save
          requires :name
          if self.id
            resp = service.put_admin_enterprises_x(self.id,
                                                   self.to_json)
          else
            resp = service.post_admin_enterprises(self.to_json)
          end
          merge_attributes(resp)
        end

        def delete
          requires :id
          service.delete_admin_enterprises_x(self.id)
        end

        def hypervisors
          requires :id, :url
          hyptype_href = hypervisortype_lnk['href']
          [].push hyptype_href.split('/').last
        end

        def enterprises
          requires :id
          response = service.get_admin_publiccloudregions_x_enterprises(self.id)
          Fog::Compute::Abiquo::Enterprises.new response.merge({:service => service})
        end
      end # PublicCloudRegion
    end # Abiquo
  end  # Compute
end # Fog