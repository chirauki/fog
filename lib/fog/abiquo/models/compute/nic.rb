module Fog
  module Compute
    class Abiquo
      class Nic < Fog::Compute::Abiquo::LinkModel
        identity :id

        attribute :ip
        attribute :mac
        attribute :sequence
        attribute :tag
        
        attribute :url
        attribute :privatenetwork_lnk
      end # Class Nic
    end # Class Abiquo
  end # module Compute
end # module Fog