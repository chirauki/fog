module Fog
  module Compute
    class Abiquo
      class NetworkInterface < Fog::Compute::Abiquo::LinkModel
        attribute :mac
        attribute :name
        attribute :networkservicetype_lnk

        def set_servicetype(service_type)
          service_type_lnk = service_type.url
          service_type_lnk['rel'] = 'networkservicetype'

          self.networkservicetype_lnk = service_type_lnk
        end
      end # Class NetworkInterface
    end # Class Abiquo
  end # module Compute
end # module Fog