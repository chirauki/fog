require 'fog/abiquo/core'
require 'digest/md5'

module Fog
  module Compute
    class Abiquo < Fog::Service
      # class BadRequest < Fog::Compute::Cloudstack::Error; end
      # class Unauthorized < Fog::Compute::Cloudstack::Error; end

      requires :abiquo_api

      recognizes :abiquo_username, :abiquo_password

      request_path 'fog/abiquo/requests/compute'

      model_path 'fog/abiquo/models/compute'
      model :virtualdatacenter
      collection :virtualdatacenters

      request :list_virtualdatacenters

      class Real
        def initialize(options={})
          @abiquo_username = options[:abiquo_username]
          @abiquo_password = options[:abiquo_password]

          @connection = Fog::Core::Connection.new(options[:abiquo_api], options[:abiquo_persistent], {:ssl_verify_peer => false})
        end

        def reload
          @connection.reset
        end

        def request(params)
          params.reject!{|k,v| v.nil?}

          # params.merge!('response' => 'json')

          # This should be changed to check cookie auth
          # if has_session?
            # params, headers = authorize_session(params)
          # elsif has_keys?
            # params, headers = authorize_api_keys(params)
          # end
          headers={}
          # headers.merge!('Accept' => params[:accept]) if params.extract!(:accept)          
          headers.merge!('Accept' => params.delete(:accept)) if params.has_key?(:accept)
          # Only basic-auth is supported at the moment, it would be nice auth by cookie
          headers.merge!({'Authorization' => "Basic #{Base64.encode64(@abiquo_username+":"+@abiquo_password).delete("\r\n")}"})

          path = params.delete(:path)


          response = issue_request(path,params,headers)
          response = Fog::JSON.decode(response.body) unless response.body.empty?
          response
        end

        def issue_request(path,params={},headers={}, method='GET',expects=200)
          begin
            @connection.request({
              :path => path,
              :query => params,
              :headers => headers,
              :method => method,
              :expects => expects
            })

          rescue Excon::Errors::HTTPStatusError => error
            error_response = Fog::JSON.decode(error.response.body)

            error_code = error_response.values.first['errorcode']
            error_text = error_response.values.first['errortext']

            case error_code
            when 401
              raise Fog::Compute::Cloudstack::Unauthorized, error_text
            when 431
              raise Fog::Compute::Cloudstack::BadRequest, error_text
            else
              raise Fog::Compute::Cloudstack::Error, error_text
            end
          end
        end
        
        # def login(username,password)
        #   response = issue_request({
        #     'response' => 'json',
        #     'command'  => 'login',
        #     'username' => username,
        #     'password' => Digest::MD5.hexdigest(password),
        #     'domain'   => domain
        #   })

        #   # Parse response cookies to retrive JSESSIONID token
        #   cookies   = CGI::Cookie.parse(response.headers['Set-Cookie'])
        #   sessionid = cookies['JSESSIONID'].first

        #   # Decode the login response
        #   response   = Fog::JSON.decode(response.body)

        #   user = response['loginresponse']
        #   user.merge!('sessionid' => sessionid)

        #   @cloudstack_session_id  = user['sessionid']
        #   @cloudstack_session_key = user['sessionkey']

        #   user
        # end

      #   def request(params)
      #     params.reject!{|k,v| v.nil?}

      #     params.merge!('response' => 'json')

      #     if has_session?
      #       params, headers = authorize_session(params)
      #     elsif has_keys?
      #       params, headers = authorize_api_keys(params)
      #     end

      #     response = issue_request(params,headers)
      #     response = Fog::JSON.decode(response.body) unless response.body.empty?
      #     response
      #   end

      #   private
      #   def has_session?
      #     @cloudstack_session_id && @cloudstack_session_key
      #   end

      #   def has_keys?
      #     @cloudstack_api_key && @cloudstack_secret_access_key
      #   end

      #   def authorize_session(params)
      #     # set the session id cookie for the request
      #     headers = {'Cookie' => "JSESSIONID=#{@cloudstack_session_id};"}
      #     # set the sesion key for the request, params are not signed using session auth
      #     params.merge!('sessionkey' => @cloudstack_session_key)

      #     return params, headers
      #   end

      #   def authorize_api_keys(params)
      #     headers = {}
      #     # merge the api key into the params
      #     params.merge!('apiKey' => @cloudstack_api_key)
      #     # sign the request parameters
      #     signature = Fog::Cloudstack.signed_params(@cloudstack_secret_access_key,params)
      #     # merge signature into request param
      #     params.merge!({'signature' => signature})

      #     return params, headers
      #   end

      #   def issue_request(params={},headers={},method='GET',expects=200)
      #     begin
      #       @connection.request({
      #         :query => params,
      #         :headers => headers,
      #         :method => method,
      #         :expects => expects
      #       })

      #     rescue Excon::Errors::HTTPStatusError => error
      #       error_response = Fog::JSON.decode(error.response.body)

      #       error_code = error_response.values.first['errorcode']
      #       error_text = error_response.values.first['errortext']

      #       case error_code
      #       when 401
      #         raise Fog::Compute::Cloudstack::Unauthorized, error_text
      #       when 431
      #         raise Fog::Compute::Cloudstack::BadRequest, error_text
      #       else
      #         raise Fog::Compute::Cloudstack::Error, error_text
      #       end
      #     end
      #   end
      end # Real

      class Mock
      #   def initialize(options={})
      #     @cloudstack_api_key = options[:cloudstack_api_key]
      #   end

      #   def self.data
      #     @data ||= begin
      #       zone_id     = Fog.credentials[:cloudstack_zone_id]             || Fog::Cloudstack.uuid
      #       image_id    = Fog.credentials[:cloudstack_template_id]         || Fog::Cloudstack.uuid
      #       flavor_id   = Fog.credentials[:cloudstack_service_offering_id] || Fog::Cloudstack.uuid
      #       network_id  = (Array(Fog.credentials[:cloudstack_network_ids]) || [Fog::Cloudstack.uuid]).first
      #       domain_name = "exampleorg"
      #       account_id, user_id, domain_id = Fog::Cloudstack.uuid, Fog::Cloudstack.uuid, Fog::Cloudstack.uuid
      #       domain = {
      #         "id"               => domain_id,
      #         "name"             => domain_name,
      #         "level"            => 1,
      #         "parentdomainid"   => Fog::Cloudstack.uuid,
      #         "parentdomainname" => "ROOT",
      #         "haschild"         => false,
      #         "path"             => "ROOT/accountname"
      #       }
      #       user = {
      #         "id"          => user_id,
      #         "username"    => "username",
      #         "firstname"   => "Bob",
      #         "lastname"    => "Lastname",
      #         "email"       => "email@example.com",
      #         "created"     => "2012-05-14T16:25:17-0500",
      #         "state"       => "enabled",
      #         "account"     => "accountname",
      #         "accounttype" => 2,
      #         "domainid"    => domain_id,
      #         "domain"      => domain_name,
      #         "apikey"      => Fog::Cloudstack.uuid,
      #         "secretkey"   => Fog::Cloudstack.uuid
      #       }
      #       {
      #         :users    => { user_id    => user },
      #         :networks => { network_id => {
      #           "id"                          => network_id,
      #           "name"                        => "10.56.23.0/26",
      #           "displaytext"                 => "10.56.23.0/26",
      #           "broadcastdomaintype"         => "Vlan",
      #           "traffictype"                 => "Guest",
      #           "gateway"                     => "10.56.23.1",
      #           "netmask"                     => "255.255.255.192",
      #           "cidr"                        => "10.56.23.0/26",
      #           "zoneid"                      => zone_id,
      #           "zonename"                    => "zone-00",
      #           "networkofferingid"           => "af0c9bd5-a1b2-4ad0-bf4b-d6fa9b1b9d5b",
      #           "networkofferingname"         => "DefaultSharedNetworkOffering",
      #           "networkofferingdisplaytext"  => "Offering for Shared networks",
      #           "networkofferingavailability" => "Optional",
      #           "issystem"                    => false,
      #           "state"                       => "Setup",
      #           "related"                     => "86bbc9fc-d92e-49db-9fdc-296189090017",
      #           "broadcasturi"                => "vlan://800",
      #           "dns1"                        => "10.0.80.11",
      #           "type"                        => "Shared",
      #           "vlan"                        => "800",
      #           "acltype"                     => "Domain",
      #           "subdomainaccess"             => true,
      #           "domainid"                    => domain_id,
      #           "domain"                      => "ROOT",
      #           "service" => [
      #             {"name" => "UserData"},
      #             {"name" => "Dhcp"},
      #             {
      #               "name"       => "Dns",
      #               "capability" => [
      #                 {
      #                   "name"                       => "AllowDnsSuffixModification",
      #                   "value"                      => "true",
      #                   "canchooseservicecapability" => false
      #                 }
      #               ]
      #           }],
      #           "networkdomain"     => "cs1cloud.internal",
      #           "physicalnetworkid" => "8f4627c5-1fdd-4504-8a92-f61b4e9cb3e3",
      #           "restartrequired"   => false,
      #           "specifyipranges"   => true}
      #         },
      #         :zones => { zone_id => {
      #           "id"                    => zone_id,
      #           "name"                  => "zone-00",
      #           "domainid"              => 1,
      #           "domainname"            => "ROOT",
      #           "networktype"           => "Advanced",
      #           "securitygroupsenabled" => false,
      #           "allocationstate"       => "Enabled",
      #           "zonetoken"             => Fog::Cloudstack.uuid,
      #           "dhcpprovider"          => "VirtualRouter"}},
      #         :images => { image_id => {
      #           "id"              => image_id,
      #           "name"            => "CentOS 5.6(64-bit) no GUI (XenServer)",
      #           "displaytext"     => "CentOS 5.6(64-bit) no GUI (XenServer)",
      #           "ispublic"        => true,
      #           "created"         => "2012-05-09T15:29:33-0500",
      #           "isready"         => true,
      #           "passwordenabled" => false,
      #           "format"          => "VHD",
      #           "isfeatured"      => true,
      #           "crossZones"      => true,
      #           "ostypeid"        => "a6a6694a-18f5-4765-8418-2b7a5f37cd0f",
      #           "ostypename"      => "CentOS 5.3 (64-bit)",
      #           "account"         => "system",
      #           "zoneid"          => zone_id,
      #           "zonename"        => "zone-00",
      #           "status"          => "Download Complete",
      #           "size"            => 21474836480,
      #           "templatetype"    => "BUILTIN",
      #           "domain"          => "ROOT",
      #           "domainid"        => "6023b6fe-5bef-4358-bc76-9f4e75afa52f",
      #           "isextractable"   => true,
      #           "checksum"        => "905cec879afd9c9d22ecc8036131a180",
      #           "hypervisor"      => "Xen"
      #         }},
      #         :flavors => { flavor_id => {
      #           "id"          => flavor_id,
      #           "name"        => "Medium Instance",
      #           "displaytext" => "Medium Instance",
      #           "cpunumber"   => 1,
      #           "cpuspeed"    => 1000,
      #           "memory"      => 1024,
      #           "created"     => "2012-05-09T14:48:36-0500",
      #           "storagetype" => "shared",
      #           "offerha"     => false,
      #           "limitcpuuse" => false,
      #           "issystem"    => false,
      #           "defaultuse"  => false}},
      #         :accounts => { account_id => {
      #           "id"                => account_id,
      #           "name"              => "accountname",
      #           "accounttype"       => 2,
      #           "domainid"          => domain_id,
      #           "domain"            => domain_name,
      #           "receivedbytes"     => 0,
      #           "sentbytes"         => 0,
      #           "vmlimit"           => "Unlimited",
      #           "vmtotal"           => 0,
      #           "vmavailable"       => "Unlimited",
      #           "iplimit"           => "Unlimited",
      #           "iptotal"           => 0,
      #           "ipavailable"       => "Unlimited",
      #           "volumelimit"       => "Unlimited",
      #           "volumetotal"       => 0,
      #           "volumeavailable"   => "Unlimited",
      #           "snapshotlimit"     => "Unlimited",
      #           "snapshottotal"     => 0,
      #           "snapshotavailable" => "Unlimited",
      #           "templatelimit"     => "Unlimited",
      #           "templatetotal"     => 0,
      #           "templateavailable" => "Unlimited",
      #           "vmstopped"         => 0,
      #           "vmrunning"         => 0,
      #           "projectlimit"      => "Unlimited",
      #           "projecttotal"      => 1,
      #           "projectavailable"  => "Unlimited",
      #           "networklimit"      => "Unlimited",
      #           "networktotal"      => 0,
      #           "networkavailable"  => "Unlimited",
      #           "state"             => "enabled",
      #           "user"              => [user]}
      #         },
      #         :domains         => {domain_id => domain},
      #         :servers         => {},
      #         :jobs            => {},
      #         :volumes         => {
      #           "89198f7c-0245-aa1d-136a-c5f479ef9db7" => {
      #             "id"=> "89198f7c-0245-aa1d-136a-c5f479ef9db7",
      #             "name"=>"test volume",
      #             "zoneid"=> zone_id,
      #             "zonename"=>"zone-00",
      #             "type"=>"DATADISK",
      #             "deviceid"=>1,
      #             "virtualmachineid"=> "51dcffee-5f9f-29a4-acee-2717e1a3656b",
      #             "vmname"=>"i-2824-11621-VM",
      #             "vmdisplayname"=>"test vm",
      #             "vmstate"=>"Running",
      #             "size"=>17179869184,
      #             "created"=>"2013-04-16T12:33:41+0000",
      #             "state"=>"Ready",
      #             "account"=> 'accountname',
      #             "domainid"=> domain_id,
      #             "domain"=> domain_name,
      #             "storagetype"=>"shared",
      #             "hypervisor"=>"KVM",
      #             "diskofferingid"=> "cc4de87d-672d-4353-abb5-6a8a4c0abf59",
      #             "diskofferingname"=>"Small Disk",
      #             "diskofferingdisplaytext"=>"Small Disk [16GB Disk]",
      #             "storage"=>"ps1",
      #             "attached"=>"2013-04-16T12:34:07+0000",
      #             "destroyed"=>false,
      #             "isextractable"=>false
      #             },
      #           },
      #         :security_groups => {},
      #         :snapshots       => {},
      #         :disk_offerings  => {
      #           "cc4de87d-672d-4353-abb5-6a8a4c0abf59" => {
      #             "id"           => "cc4de87d-672d-4353-abb5-6a8a4c0abf59",
      #             "domainid"     => domain_id,
      #             "domain"       => domain_name,
      #             "name"         => "Small Disk",
      #             "displaytext"  => "Small Disk [16GB Disk]",
      #             "disksize"     => 16,
      #             "created"      => "2013-02-21T03:12:520300",
      #             "iscustomized" => false,
      #             "storagetype"  =>  "shared"
      #           },
      #           "d5deeb0c-de03-4ebf-820a-dc74221bcaeb" => {
      #             "id"           => "d5deeb0c-de03-4ebf-820a-dc74221bcaeb",
      #             "domainid"     => domain_id,
      #             "domain"       => domain_name,
      #             "name"         => "Medium Disk",
      #             "displaytext"  => "Medium Disk [32GB Disk]",
      #             "disksize"     => 32,
      #             "created"      => "2013-02-21T03:12:520300",
      #             "iscustomized" => false,
      #             "storagetype"  => "shared"
      #           }
      #         },
      #         :os_types  => {
      #           "51ef854d-279e-4e68-9059-74980fd7b29b" => {
      #             "id"           => "51ef854d-279e-4e68-9059-74980fd7b29b",
      #             "oscategoryid" => "56f67279-e082-45c3-a01c-d290d6cd4ce2",
      #             "description"  => "Asianux 3(32-bit)"
      #             },
      #           "daf124c8-95d8-4756-8e1c-1871b073babb" => {
      #             "id"           => "daf124c8-95d8-4756-8e1c-1871b073babb",
      #             "oscategoryid" => "56f67279-e082-45c3-a01c-d290d6cd4ce2",
      #             "description"  => "Asianux 3(64-bit)"
      #             }
      #         }
      #       }
      #     end
      #   end

      #   def self.reset
      #     @data = nil
      #   end

      #   def data
      #     self.class.data
      #   end

      #   def reset_data
      #     self.class.data.delete(@cloudstack_api_key)
      #   end
      end # Mock
    end # Abiquo
  end # Compute
end # Fog
