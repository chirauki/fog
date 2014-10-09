module Fog
  module Compute
    class Abiquo
      class Hypervisortype < Fog::Compute::Abiquo::LinkModel
        identity :name

        attribute :realName
        attribute :baseFormat
        attribute :compatibilityTable
        attribute :constraints
        attribute :operations

        attribute :url
        attribute :checkcredentials_lnk
        attribute :regions_lnk
        attribute :metricsmetadata_lnk

      end # Class HypervisorType
    end # Class Abiquo
  end # module Compute
end # module Fog