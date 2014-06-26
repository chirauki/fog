module Fog
  module Compute
    class Abiquo
      class VirtualDatacenter < Fog::Compute::Abiquo::LinkModel
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

        attribute :enterprise_lnk

        attribute :links

        def reload
          requires :id
          service.get_virtualdatacenter(self.id)
        end

        def save
          requires :name
          resp = service.create_virtualdatacenter({:name => self.name, :links => self.links})
          merge_attributes(resp.body)
        end

        def virtualapps
          requires :id
          @virtualapps ||= Fog::Compute::Abiquo::Virtualapps.new :vapps_lnk => self.links.select {|l| l['rel'] == 'virtualappliances' }.first['href'], :service => service
        end
      end # Class VDC
    end # Class Abiquo
  end # module Compute
end # module Fog