module Fog
  module Compute
    class Abiquo
      class Real
        def create_rack( options = {} )

          # Extract datacenter link
          datacenter_link = options[:datacenter].links.select { |x| x['rel'] == 'edit' }.first
          datacenter_link["rel"] = "datacenter"
          # Build racks link
          racks_link = "#{datacenter_link['href']}/racks"

          payload = {
            :name       => options[:name],
            :links      => [datacenter_link]
          }

          vanilla_options = [:haEnabled, :vlanIdMin, :haEnabled, :name, :nrsq, :vlanIdMax, :vlanIdMin, :vlanPerVdcReserved ]
          vanilla_options.reject{ |o| options[o].nil? }.each do |key|
            payload[key] = options[key]
          end

          request(
            :expects  => [200, 201],
            :method   => 'POST',
            :path     => racks_link,
            :accept   => 'application/vnd.abiquo.rack+json',
            :content  => 'application/vnd.abiquo.rack+json',
            :body     => payload.to_json
          )
        end

      end


      class Mock
        def create_rack
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
