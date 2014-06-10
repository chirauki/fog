module Fog
  module Compute
    class Abiquo
      class VirtualDatacenter < Fog::Model
        identity  :id

        attribute :name
        attribute :publicIpsHard
        attribute :publicIpsSoft
        attribute :ramHardLimitInMb
        attribute :ramSoftLimitInMb
        attribute :storageHardInMb
        attribute :storageSoftInMb
        attribute :vlansHard
        attribute :vlansSoft
        attribute :cpuCountHardLimit
        attribute :cpuCountSoftLimit
        attribute :diskHardLimitInMb
        attribute :diskSoftLimitInMb
        attribute :hypervisorType

        attribute :links
        
        def reload
          requires :id
          service.get_virtualdatacenter(self.id)
        end

        def virtualapps
          requires :id
          @virtualapps ||= Fog::Compute::Abiquo::Virtualapps.new :vapps_lnk => self.links.select {|l| l['rel'] == 'virtualappliances' }.first['href'], :service => service
        end
      end # Class VDC
    end # Class Abiquo
  end # module Compute
end # module Fog