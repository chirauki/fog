module Fog
  module Compute
    class Abiquo
      class Real
        def put_cloud_virtualdatacenters_x_publicips_purchased_x(virtualdatacenter, ip, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}//publicips/purchased/#{ip}",
            :accept   => "application/vnd.abiquo.publicip+json",
            :content  => "*/*",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_cloud_virtualdatacenters_x_publicips_purchased_x(virtualdatacenter, ip, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
