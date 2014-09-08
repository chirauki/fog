module Fog
  module Compute
    class Abiquo
      class Real
        def post_cloud_virtualdatacenters(payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => "/cloud/virtualdatacenters",
            :accept   => "application/vnd.abiquo.virtualdatacenter+json",
            :content  => "application/vnd.abiquo.virtualdatacenter+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def post_cloud_virtualdatacenters(payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
