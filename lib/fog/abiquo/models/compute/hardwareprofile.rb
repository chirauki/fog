module Fog
  module Compute
    class Abiquo
      class HardwareProfile < Fog::Compute::Abiquo::LinkModel
        attribute :cpu
        attribute :ramInMb
        attribute :providerId

        attribute :url
        attribute :enterprise_lnk
        attribute :enterprise_id
        attribute :location_lnk
        attribute :location_id
      end # HardwareProfile
    end # Abiquo
  end  # Compute
end # Fog