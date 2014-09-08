module Fog
  module Compute
    class Abiquo
      class Real
        def put_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x(virtualdatacenter, virtualappliance, virtualmachine, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/virtualappliances/#{virtualappliance}/virtualmachines/#{virtualmachine}",
            :accept   => "application/vnd.abiquo.acceptedrequest+json",
            :content  => "application/vnd.abiquo.virtualmachine+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x(virtualdatacenter, virtualappliance, virtualmachine, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
