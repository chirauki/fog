module Fog
  module Compute
    class Abiquo
      class Volume < Fog::Compute::Abiquo::LinkModel
        identity :id

        attribute :name
        attribute :state
        attribute :sizeInMB
        attribute :sequence
        attribute :allowResize

        attribute :url
        attribute :tier_lnk
        attribute :tier_id
        attribute :initiatormappings_lnk
        attribute :virtualdatacenter_lnk
        attribute :virtualdatacenter_id
        attribute :virtualappliance_lnk
        attribute :virtualappliance_id
        attribute :virtualmachine_lnk
        attribute :virtualmachine_id

      end # Class Volume
    end # Class Abiquo
  end # module Compute
end # module Fog