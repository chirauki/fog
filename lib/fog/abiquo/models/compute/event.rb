module Fog
  module Compute
    class Abiquo
      class Event < Fog::Compute::Abiquo::LinkModel
        identity :id

        attribute :actionPerformed
        attribute :component
        attribute :enterprise
        attribute :id
        attribute :idEnterprise
        attribute :idUser
        attribute :idVirtualMachine
        attribute :links
        attribute :performedBy
        attribute :severity
        attribute :stacktrace
        attribute :timestamp
        attribute :user
        attribute :virtualMachine

      end # Class Event
    end # Class Abiquo
  end # module Compute
end # module Fog