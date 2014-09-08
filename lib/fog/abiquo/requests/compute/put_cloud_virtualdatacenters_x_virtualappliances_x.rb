module Fog
  module Compute
    class Abiquo
      class Real
        def put_cloud_virtualdatacenters_x_virtualappliances_x(virtualdatacenter, virtualappliance, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}/virtualappliances/#{virtualappliance}",
            :accept   => "application/vnd.abiquo.virtualappliance+json",
            :content  => "application/vnd.abiquo.virtualappliance+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_cloud_virtualdatacenters_x_virtualappliances_x(virtualdatacenter, virtualappliance, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
