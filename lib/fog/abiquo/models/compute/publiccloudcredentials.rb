require 'fog/core/collection'
require 'fog/abiquo/models/compute/publiccloudcredential'

module Fog
  module Compute
    class Abiquo
      class PublicCloudCredentials < Fog::Collection
        model Fog::Compute::Abiquo::PublicCloudCredential

        def all(options = {})
          @enterprise_id ||= attributes[:enterprise_id]
          response = service.get_admin_enterprises_x_credentials(@enterprise_id)
          load(response)
        end

        def get(id)
          @enterprise_id ||= attributes[:enterprise_id]
          response = service.get_admin_enterprises_x_credentials_x(@enterprise_id,
                                                                   id)
          new(response)
        end

        def where(args={})
          @enterprise_id ||= attributes[:enterprise_id]
          items = service.get_admin_enterprises_x_credentials(@enterprise_id)
          result_items = []

          return load(items) if args.empty?
          
          args.keys.each do |arg|
            result_items += items.select {|i| i[arg.to_s] == args[arg]}
          end
          load(result_items)
        end

        def destroy(id)
          @enterprise_id ||= attributes[:enterprise_id]
          service.delete_admin_enterprises_x_credentials_x(@enterprise_id,
                                                            id)
        end

        def create(args = {})
          @enterprise_id ||= attributes[:enterprise_id]

          hyp_lnk = args.delete(:hypervisortype).url
          hyp_lnk['rel'] = 'hypervisortype'

          object = new(args)
          object.hypervisortype_lnk = hyp_lnk
          object.enterprise_id = @enterprise_id
          object.save
          object
        end
      end
    end
  end
end
