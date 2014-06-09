require 'fog/core'

module Fog
  module Abiquo
    extend Fog::Provider

    service(:compute, 'Compute')
  end
end
