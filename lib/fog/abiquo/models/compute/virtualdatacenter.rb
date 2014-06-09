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

        def reload
          requires :id
          service.get_virtualdatacenter('vdc_id' => self.id)
        end

        def ready?
          self.job_status != 0
        end

        def successful?
          self.job_result_code == 0
        end

        # so dirty
        def result
          if successful? && model = Fog::Compute::Cloudstack.constants.find{|c| c.to_s.downcase == self.job_result.keys.first.to_s}.to_s
            collection = model.gsub(/.[A-Z]/){|w| "#{w[0,1]}_#{w[1,1].downcase}"}.downcase + "s" # cheap underscorize, assume simple pluralization
            service.send(collection).new(self.job_result.values.first)
          else self.job_result
          end
        end
      end # Class VDC
    end # Class Abiquo
  end # module Compute
end # module Fog