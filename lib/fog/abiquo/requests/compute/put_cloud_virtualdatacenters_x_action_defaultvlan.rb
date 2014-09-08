module Fog
  module Compute
    class Abiquo
      class Real
        def put_cloud_virtualdatacenters_x_action_defaultvlan(virtualdatacenter, payload, options = {})
          request(
            :expects  => [200, 201],
            :method   => 'PUT',
            :path     => "/cloud/virtualdatacenters/#{virtualdatacenter}//action/defaultvlan",
            :accept   => "*/*",
            :content  => "application/vnd.abiquo.links+json",
            :body     => payload,
            :query    => options
          )
        end
      end

      class Mock
        def put_cloud_virtualdatacenters_x_action_defaultvlan(virtualdatacenter, payload, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
