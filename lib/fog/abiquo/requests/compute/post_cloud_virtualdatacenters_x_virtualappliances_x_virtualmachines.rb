module Fog
  module Compute
    class Abiquo
      class Real
        def post_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines(virtualdatacenter, virtualappliance, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/virtualappliances/#{virtualappliance}/virtualmachines",
            :accept   => "application/vnd.abiquo.virtualmachinewithnode+json",
            :content  => "application/vnd.abiquo.virtualmachinewithnode+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines(virtualdatacenter, virtualappliance, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end