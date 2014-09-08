module Fog
  module Compute
    class Abiquo
      class Real
        def get_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates(enterprise, datacenterrepository, options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/admin/enterprises/#{enterprise}/datacenterrepositories/#{datacenterrepository}/virtualmachinetemplates",
            :accept   => "application/vnd.abiquo.virtualmachinetemplates+json",
            :query    => options
          )
        end
      end

      class Mock
        def get_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates(enterprise, datacenterrepository, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
