require 'fog/abiquo/core'
require 'fog/abiquo/common/linkmodel'
require 'fog/abiquo/common/linkserver'
require 'digest/md5'
require 'uri'

module Fog
  module Compute
    class Abiquo < Fog::Service
      include Links
      
      class Fog::Compute::Abiquo::Error; end
      class Fog::Compute::Abiquo::InvalidCredentials < Fog::Compute::Abiquo::Error; end
      class Fog::Compute::Abiquo::Forbidden < Fog::Compute::Abiquo::Error; end
      class Fog::Compute::Abiquo::BadRequest < Fog::Compute::Abiquo::Error; end
      class Fog::Compute::Abiquo::UnsupportedMediaType < Fog::Compute::Abiquo::Error; end

      requires :abiquo_api_url, :abiquo_username, :abiquo_password
      attr_reader :enterprise
      attr_reader :user
      attr_reader :config_properties

      model_path 'fog/abiquo/models/compute'
      model :location
      collection :locations
      model :hardwareprofile
      collection :hardwareprofiles
      model :virtualdatacenter
      collection :virtualdatacenters
      model :virtualmachinetemplate
      collection :virtualmachinetemplates
      model :virtualappliance
      collection :virtualappliances
      model :virtualmachine
      collection :virtualmachines
      model :volume
      collection :volumes
      model :nic
      collection :nics
      model :task
      collection :tasks
      model :enterprise
      collection :enterprises
      collection :enterprisevirtualmachines
      model :publiccloudcredential
      collection :publiccloudcredentials
      model :event
      collection :events
      model :datacenter
      collection :datacenters
      model :rack
      collection :racks
      model :machine
      collection :machines
      model :datastore
      collection :datastores
      model :remoteservice
      collection :remoteservices
      model :publiccloudregion
      collection :public_cloud_regions

      request_path 'fog/abiquo/requests/compute'
      request :delete_admin_datacenters_x
      request :delete_admin_datacenters_x_backups_x
      request :delete_admin_datacenters_x_network_x
      request :delete_admin_datacenters_x_networkservicetypes_x
      request :delete_admin_datacenters_x_racks_x
      request :delete_admin_datacenters_x_racks_x_machines_x
      request :delete_admin_datacenters_x_racks_x_machines_x_virtualmachines
      request :delete_admin_datacenters_x_remoteservices_x
      request :delete_admin_datacenters_x_storage_devices_x
      request :delete_admin_datacenters_x_storage_devices_x_pools_x
      request :delete_admin_enterprises_x
      request :delete_admin_enterprises_x_appslib_templateDefinitionLists_x
      request :delete_admin_enterprises_x_appslib_templateDefinitions_x
      request :delete_admin_enterprises_x_credentials_x
      request :delete_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x
      request :delete_admin_enterprises_x_limits_x
      request :delete_admin_enterprises_x_reservedmachines_x
      request :delete_admin_enterprises_x_users_x
      request :delete_admin_enterprises_x_users_x_applications_x
      request :delete_admin_publiccloudregions_x
      request :delete_admin_publiccloudregions_x_remoteservices_x
      request :delete_admin_roles_x
      request :delete_admin_rolesldap_x
      request :delete_admin_rules_enterpriseExclusions_x
      request :delete_admin_rules_fitsPolicy_x
      request :delete_admin_rules_machineLoadLevel_x
      request :delete_admin_scopes_x
      request :delete_cloud_locations_x_firewalls_x
      request :delete_cloud_locations_x_ips_x
      request :delete_cloud_locations_x_loadbalancers_x
      request :delete_cloud_locations_x_loadbalancers_x_healthchecks_x
      request :delete_cloud_locations_x_loadbalancers_x_routingrules_x
      request :delete_cloud_virtualdatacenters_x
      request :delete_cloud_virtualdatacenters_x_disks_x
      request :delete_cloud_virtualdatacenters_x_privatenetworks_x
      request :delete_cloud_virtualdatacenters_x_virtualappliances_x
      request :delete_cloud_virtualdatacenters_x_virtualappliances_x_layers_x
      request :delete_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x
      request :delete_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_metadata
      request :delete_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_storage_disks
      request :delete_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_storage_disks_x
      request :delete_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_storage_volumes
      request :delete_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_storage_volumes_x
      request :delete_cloud_virtualdatacenters_x_volumes_x
      request :delete_config_categories_x
      request :delete_config_costcodes_x
      request :delete_config_costcodes_x_currencies
      request :delete_config_costcodes_x_currencies_x
      request :delete_config_currencies_x
      request :delete_config_licenses_x
      request :delete_config_pricingtemplates_x
      request :delete_config_properties_x
      request :delete_login_sessions_users_x
      request :delete_login_sessions_x_x
      request :get_admin_datacenters
      request :get_admin_datacenters_x
      request :get_admin_datacenters_x_action_checkmachineipmistate
      request :get_admin_datacenters_x_action_checkmachinestate
      request :get_admin_datacenters_x_action_discover
      request :get_admin_datacenters_x_action_enterprises
      request :get_admin_datacenters_x_action_getlimits
      request :get_admin_datacenters_x_backups
      request :get_admin_datacenters_x_backups_x
      request :get_admin_datacenters_x_hypervisors
      request :get_admin_datacenters_x_network
      request :get_admin_datacenters_x_network_action_checkavailability
      request :get_admin_datacenters_x_network_action_externalips
      request :get_admin_datacenters_x_network_action_publicips
      request :get_admin_datacenters_x_network_action_unmanagedips
      request :get_admin_datacenters_x_network_x
      request :get_admin_datacenters_x_network_x_configuration
      request :get_admin_datacenters_x_network_x_configuration_x
      request :get_admin_datacenters_x_network_x_ips
      request :get_admin_datacenters_x_network_x_ips_x
      request :get_admin_datacenters_x_networkservicetypes
      request :get_admin_datacenters_x_networkservicetypes_x
      request :get_admin_datacenters_x_racks
      request :get_admin_datacenters_x_racks_x
      request :get_admin_datacenters_x_racks_x_deployedvms
      request :get_admin_datacenters_x_racks_x_machines
      request :get_admin_datacenters_x_racks_x_machines_action_bookable
      request :get_admin_datacenters_x_racks_x_machines_x
      request :get_admin_datacenters_x_racks_x_machines_x_action_checkipmi
      request :get_admin_datacenters_x_racks_x_machines_x_action_checkipmistate
      request :get_admin_datacenters_x_racks_x_machines_x_action_checkstate
      request :get_admin_datacenters_x_racks_x_machines_x_action_nics_refresh
      request :get_admin_datacenters_x_racks_x_machines_x_action_reenableafterha
      request :get_admin_datacenters_x_racks_x_machines_x_datastores
      request :get_admin_datacenters_x_racks_x_machines_x_datastores_action_refresh
      request :get_admin_datacenters_x_racks_x_machines_x_datastores_x
      request :get_admin_datacenters_x_racks_x_machines_x_virtualmachines
      request :get_admin_datacenters_x_racks_x_machines_x_virtualmachines_x
      request :get_admin_datacenters_x_racks_x_machines_x_virtualmachines_x_action_disk
      request :get_admin_datacenters_x_racks_x_machines_x_virtualmachines_x_action_nics
      request :get_admin_datacenters_x_racks_x_machines_x_virtualmachines_x_action_volumes
      request :get_admin_datacenters_x_racks_x_machines_x_virtualmachines_x_config_rdpaccess
      request :get_admin_datacenters_x_remoteservices
      request :get_admin_datacenters_x_remoteservices_x
      request :get_admin_datacenters_x_remoteservices_x_action_check
      request :get_admin_datacenters_x_storage_devices
      request :get_admin_datacenters_x_storage_devices_action_supported
      request :get_admin_datacenters_x_storage_devices_x
      request :get_admin_datacenters_x_storage_devices_x_pools
      request :get_admin_datacenters_x_storage_devices_x_pools_x
      request :get_admin_datacenters_x_storage_devices_x_pools_x_action_volumes
      request :get_admin_datacenters_x_storage_tiers
      request :get_admin_datacenters_x_storage_tiers_x
      request :get_admin_datacenters_x_storage_tiers_x_enterprises
      request :get_admin_datacenters_x_storage_tiers_x_pools
      request :get_admin_enterprises
      request :get_admin_enterprises_action_requestdownload
      request :get_admin_enterprises_x
      request :get_admin_enterprises_x_action_chefelements
      request :get_admin_enterprises_x_action_externalnetworks
      request :get_admin_enterprises_x_action_externalnetworks_x
      request :get_admin_enterprises_x_action_ips
      request :get_admin_enterprises_x_action_pendingtasks
      request :get_admin_enterprises_x_action_publicnetworks
      request :get_admin_enterprises_x_action_publicnetworks_x
      request :get_admin_enterprises_x_action_requestupload
      request :get_admin_enterprises_x_action_virtualappliances
      request :get_admin_enterprises_x_action_virtualdatacenters
      request :get_admin_enterprises_x_action_virtualmachines
      request :get_admin_enterprises_x_action_volumes
      request :get_admin_enterprises_x_appslib_templateDefinitionLists
      request :get_admin_enterprises_x_appslib_templateDefinitionLists_x
      request :get_admin_enterprises_x_appslib_templateDefinitionLists_x_actions_repositoryStatus
      request :get_admin_enterprises_x_appslib_templateDefinitions
      request :get_admin_enterprises_x_appslib_templateDefinitions_x
      request :get_admin_enterprises_x_appslib_templateDefinitions_x_actions_repositoryStatus
      request :get_admin_enterprises_x_credentials
      request :get_admin_enterprises_x_credentials_x
      request :get_admin_enterprises_x_datacenterrepositories
      request :get_admin_enterprises_x_datacenterrepositories_x
      request :get_admin_enterprises_x_datacenterrepositories_x_tasks
      request :get_admin_enterprises_x_datacenterrepositories_x_tasks_x
      request :get_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates
      request :get_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x
      request :get_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x_action_instances
      request :get_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x_action_virtualmachines
      request :get_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x_conversions
      request :get_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x_conversions_x
      request :get_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x_conversions_x_tasks
      request :get_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x_conversions_x_tasks_x
      request :get_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x_tasks
      request :get_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x_tasks_x
      request :get_admin_enterprises_x_limits
      request :get_admin_enterprises_x_limits_x
      request :get_admin_enterprises_x_limits_x_action_virtualappliances
      request :get_admin_enterprises_x_limits_x_datacenter
      request :get_admin_enterprises_x_limits_x_externalnetworks
      request :get_admin_enterprises_x_limits_x_externalnetworks_action_default
      request :get_admin_enterprises_x_limits_x_externalnetworks_x
      request :get_admin_enterprises_x_limits_x_externalnetworks_x_configuration
      request :get_admin_enterprises_x_limits_x_externalnetworks_x_configuration_x
      request :get_admin_enterprises_x_limits_x_externalnetworks_x_ips
      request :get_admin_enterprises_x_limits_x_externalnetworks_x_ips_x
      request :get_admin_enterprises_x_limits_x_hypervisors
      request :get_admin_enterprises_x_properties
      request :get_admin_enterprises_x_reservedmachines
      request :get_admin_enterprises_x_users
      request :get_admin_enterprises_x_users_x
      request :get_admin_enterprises_x_users_x_action_pendingtasks
      request :get_admin_enterprises_x_users_x_action_virtualmachines
      request :get_admin_enterprises_x_users_x_applications
      request :get_admin_enterprises_x_users_x_applications_x
      request :get_admin_publiccloudregions
      request :get_admin_publiccloudregions_x
      request :get_admin_publiccloudregions_x_enterprises
      request :get_admin_publiccloudregions_x_enterprises_x
      request :get_admin_publiccloudregions_x_enterprises_x_virtualmachines
      request :get_admin_publiccloudregions_x_enterprises_x_virtualmachines_x
      request :get_admin_publiccloudregions_x_remoteservices
      request :get_admin_publiccloudregions_x_remoteservices_x
      request :get_admin_publiccloudregions_x_remoteservices_x_action_check
      request :get_admin_roles
      request :get_admin_roles_x
      request :get_admin_roles_x_action_privileges
      request :get_admin_rolesldap
      request :get_admin_rolesldap_x
      request :get_admin_rules
      request :get_admin_rules_enterpriseExclusions
      request :get_admin_rules_enterpriseExclusions_x
      request :get_admin_rules_fitsPolicy
      request :get_admin_rules_fitsPolicy_x
      request :get_admin_rules_machineLoadLevel
      request :get_admin_rules_machineLoadLevel_x
      request :get_admin_scopes
      request :get_admin_scopes_x
      request :get_admin_statistics_cloudusage
      request :get_admin_statistics_cloudusage_actions_total
      request :get_admin_statistics_cloudusage_x
      request :get_admin_statistics_enterpriseresources
      request :get_admin_statistics_enterpriseresources_actions_total
      request :get_admin_statistics_enterpriseresources_x
      request :get_admin_statistics_vappsresources
      request :get_admin_statistics_vdcsresources
      request :get_cloud_locations
      request :get_cloud_locations_pcr
      request :get_cloud_locations_x
      request :get_cloud_locations_pcr_x
      request :get_cloud_locations_x_availabilityzones
      request :get_cloud_locations_x_availabilityzones_x
      request :get_cloud_locations_x_firewalls
      request :get_cloud_locations_x_firewalls_x
      request :get_cloud_locations_x_firewalls_x_rules
      request :get_cloud_locations_x_hardwareprofiles
      request :get_cloud_locations_x_hardwareprofiles_x
      request :get_cloud_locations_x_ips
      request :get_cloud_locations_x_ips_x
      request :get_cloud_locations_x_loadbalancers
      request :get_cloud_locations_x_loadbalancers_addresses
      request :get_cloud_locations_x_loadbalancers_addresses_x
      request :get_cloud_locations_x_loadbalancers_x
      request :get_cloud_locations_x_loadbalancers_x_addresses
      request :get_cloud_locations_x_loadbalancers_x_healthchecks
      request :get_cloud_locations_x_loadbalancers_x_healthchecks_x
      request :get_cloud_locations_x_loadbalancers_x_healthstates
      request :get_cloud_locations_x_loadbalancers_x_routingrules
      request :get_cloud_locations_x_loadbalancers_x_routingrules_x
      request :get_cloud_locations_x_loadbalancers_x_virtualmachines
      request :get_cloud_locations_x_sslcertificates
      request :get_cloud_locations_x_sslcertificates_x
      request :get_cloud_locations_x_templates
      request :get_cloud_locations_x_templates_x
      request :get_cloud_virtualdatacenters
      request :get_cloud_virtualdatacenters_x
      request :get_cloud_virtualdatacenters_x_action_defaultvlan
      request :get_cloud_virtualdatacenters_x_action_externalips
      request :get_cloud_virtualdatacenters_x_action_privateips
      request :get_cloud_virtualdatacenters_x_action_templates
      request :get_cloud_virtualdatacenters_x_action_unmanagedips
      request :get_cloud_virtualdatacenters_x_action_virtualmachines
      request :get_cloud_virtualdatacenters_x_disks
      request :get_cloud_virtualdatacenters_x_disks_x
      request :get_cloud_virtualdatacenters_x_firewalls
      request :get_cloud_virtualdatacenters_x_loadbalancers
      request :get_cloud_virtualdatacenters_x_privatenetworks
      request :get_cloud_virtualdatacenters_x_privatenetworks_x
      request :get_cloud_virtualdatacenters_x_privatenetworks_x_configuration
      request :get_cloud_virtualdatacenters_x_privatenetworks_x_configuration_x
      request :get_cloud_virtualdatacenters_x_privatenetworks_x_ips
      request :get_cloud_virtualdatacenters_x_privatenetworks_x_ips_x
      request :get_cloud_virtualdatacenters_x_privatenetworks_x_loadbalancers
      request :get_cloud_virtualdatacenters_x_publicips_purchased
      request :get_cloud_virtualdatacenters_x_publicips_purchased_x
      request :get_cloud_virtualdatacenters_x_publicips_topurchase
      request :get_cloud_virtualdatacenters_x_publicips_topurchase_x
      request :get_cloud_virtualdatacenters_x_publicvlans
      request :get_cloud_virtualdatacenters_x_publicvlans_x
      request :get_cloud_virtualdatacenters_x_tiers
      request :get_cloud_virtualdatacenters_x_tiers_x
      request :get_cloud_virtualdatacenters_x_virtualappliances
      request :get_cloud_virtualdatacenters_x_virtualappliances_x
      request :get_cloud_virtualdatacenters_x_virtualappliances_x_action_price
      request :get_cloud_virtualdatacenters_x_virtualappliances_x_layers
      request :get_cloud_virtualdatacenters_x_virtualappliances_x_layers_x
      request :get_cloud_virtualdatacenters_x_virtualappliances_x_state
      request :get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines
      request :get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x
      request :get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_config_bootstrap
      request :get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_config_rdpaccess
      request :get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_config_runlist
      request :get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_firewalls
      request :get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_loadbalancers
      request :get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_metadata
      request :get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_metrics
      request :get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_network_configurations
      request :get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_network_configurations_x
      request :get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_network_nics
      request :get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_state
      request :get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_storage_disks
      request :get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_storage_disks_x
      request :get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_storage_volumes
      request :get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_storage_volumes_x
      request :get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_tasks
      request :get_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_tasks_x
      request :get_cloud_virtualdatacenters_x_volumes
      request :get_cloud_virtualdatacenters_x_volumes_action_statefulcandidates
      request :get_cloud_virtualdatacenters_x_volumes_x
      request :get_cloud_virtualdatacenters_x_volumes_x_action_initiatormappings
      request :get_cloud_virtualdatacenters_x_volumes_x_action_initiatormappings_x
      request :get_cloud_virtualmachines
      request :get_config_backups
      request :get_config_backups_x
      request :get_config_categories
      request :get_config_categories_x
      request :get_config_costcodes
      request :get_config_costcodes_x
      request :get_config_costcodes_x_currencies
      request :get_config_costcodes_x_currencies_x
      request :get_config_currencies
      request :get_config_currencies_x
      request :get_config_diskformattypes
      request :get_config_diskformattypes_x
      request :get_config_hypervisortypes
      request :get_config_hypervisortypes_x
      request :get_config_hypervisortypes_x_metrics
      request :get_config_hypervisortypes_x_regions
      request :get_config_hypervisortypes_x_regions_x
      request :get_config_licenses
      request :get_config_licenses_x
      request :get_config_pricingtemplates
      request :get_config_pricingtemplates_x
      request :get_config_pricingtemplates_x_costcodes
      request :get_config_pricingtemplates_x_costcodes_x
      request :get_config_pricingtemplates_x_tiers
      request :get_config_pricingtemplates_x_tiers_x
      request :get_config_privileges
      request :get_config_privileges_x
      request :get_config_properties
      request :get_config_properties_x
      request :get_events
      request :get_events_x
      request :get_login
      request :get_login_sessions
      request :get_login_sessions_x
      request :get_login_sessions_x_x
      request :get_statistics_cloudusage
      request :get_statistics_cloudusage_actions_total
      request :get_statistics_cloudusage_x
      request :get_statistics_enterpriseresources
      request :get_statistics_enterpriseresources_actions_total
      request :get_statistics_enterpriseresources_x
      request :get_statistics_vappsresources
      request :get_statistics_vdcsresources
      request :get_version
      request :post_admin_datacenters
      request :post_admin_datacenters_x_backups
      request :post_admin_datacenters_x_network
      request :post_admin_datacenters_x_network_x_ips
      request :post_admin_datacenters_x_networkservicetypes
      request :post_admin_datacenters_x_racks
      request :post_admin_datacenters_x_racks_x_machines
      request :post_admin_datacenters_x_racks_x_machines_x_action_sendmail
      request :post_admin_datacenters_x_racks_x_machines_x_virtualmachines_x_action_capture
      request :post_admin_datacenters_x_racks_x_machines_x_virtualmachines_x_action_sendmail
      request :post_admin_datacenters_x_remoteservices
      request :post_admin_datacenters_x_storage_devices
      request :post_admin_datacenters_x_storage_devices_x_pools
      request :post_admin_enterprises
      request :post_admin_enterprises_x_appslib_templateDefinitionLists
      request :post_admin_enterprises_x_appslib_templateDefinitions
      request :post_admin_enterprises_x_appslib_templateDefinitions_x_actions_repositoryInstall
      request :post_admin_enterprises_x_appslib_templateDefinitions_x_actions_repositoryUninstall
      request :post_admin_enterprises_x_credentials
      request :post_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates
      request :post_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x_action_deletefile
      request :post_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x_conversions
      request :post_admin_enterprises_x_limits
      request :post_admin_enterprises_x_reservedmachines
      request :post_admin_enterprises_x_reservedmachines_machine
      request :post_admin_enterprises_x_users
      request :post_admin_enterprises_x_users_x_applications
      request :post_admin_publiccloudregions
      request :post_admin_publiccloudregions_x_remoteservices
      request :post_admin_roles
      request :post_admin_rolesldap
      request :post_admin_rules
      request :post_admin_rules_enterpriseExclusions
      request :post_admin_rules_fitsPolicy
      request :post_admin_rules_machineLoadLevel
      request :post_admin_scopes
      request :post_cloud_locations_x_firewalls
      request :post_cloud_locations_x_ips
      request :post_cloud_locations_x_loadbalancers
      request :post_cloud_locations_x_loadbalancers_x_healthchecks
      request :post_cloud_locations_x_loadbalancers_x_routingrules
      request :post_cloud_virtualdatacenters
      request :post_cloud_virtualdatacenters_x_disks
      request :post_cloud_virtualdatacenters_x_privatenetworks
      request :post_cloud_virtualdatacenters_x_privatenetworks_x_ips
      request :post_cloud_virtualdatacenters_x_virtualappliances
      request :post_cloud_virtualdatacenters_x_virtualappliances_x_action_deploy
      request :post_cloud_virtualdatacenters_x_virtualappliances_x_action_undeploy
      request :post_cloud_virtualdatacenters_x_virtualappliances_x_layers
      request :post_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines
      request :post_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_action_deploy
      request :post_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_action_instance
      request :post_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_action_reset
      request :post_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_action_undeploy
      request :post_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_config_runlist
      request :post_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_disablemonitoring
      request :post_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_enablemonitoring
      request :post_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_storage_disks
      request :post_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_storage_volumes
      request :post_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_tasks_x_action_ack
      request :post_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_tasks_x_action_cancel
      request :post_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_tasks_x_action_continue
      request :post_cloud_virtualdatacenters_x_volumes
      request :post_cloud_virtualdatacenters_x_volumes_x_action_move
      request :post_config_action_remoteservicecheck
      request :post_config_categories
      request :post_config_costcodes
      request :post_config_costcodes_x_currencies
      request :post_config_currencies
      request :post_config_hypervisortypes_x_action_checkcredentials
      request :post_config_licenses
      request :post_config_pricingtemplates
      request :post_config_pricingtemplates_x_costcodes
      request :post_config_pricingtemplates_x_tiers
      request :post_config_properties
      request :post_logout
      request :put_admin_datacenters_x
      request :put_admin_datacenters_x_action_updateusedresources
      request :put_admin_datacenters_x_backups
      request :put_admin_datacenters_x_backups_x
      request :put_admin_datacenters_x_network_x
      request :put_admin_datacenters_x_network_x_ips
      request :put_admin_datacenters_x_network_x_ips_x
      request :put_admin_datacenters_x_networkservicetypes_x
      request :put_admin_datacenters_x_racks_x
      request :put_admin_datacenters_x_racks_x_machines_x
      request :put_admin_datacenters_x_racks_x_machines_x_datastores_x
      request :put_admin_datacenters_x_remoteservices_x
      request :put_admin_datacenters_x_storage_devices_x
      request :put_admin_datacenters_x_storage_devices_x_pools_x
      request :put_admin_datacenters_x_storage_tiers_x
      request :put_admin_datacenters_x_storage_tiers_x_action_allowallenterprises
      request :put_admin_datacenters_x_storage_tiers_x_action_restrictallenterprises
      request :put_admin_enterprises_x
      request :put_admin_enterprises_x_appslib_templateDefinitionLists_x
      request :put_admin_enterprises_x_appslib_templateDefinitions_x
      request :put_admin_enterprises_x_credentials_x
      request :put_admin_enterprises_x_datacenterrepositories_x_actions_refresh
      request :put_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x
      request :put_admin_enterprises_x_datacenterrepositories_x_virtualmachinetemplates_x_conversions_x
      request :put_admin_enterprises_x_limits_x
      request :put_admin_enterprises_x_limits_x_externalnetworks_action_default
      request :put_admin_enterprises_x_limits_x_externalnetworks_x_action_default
      request :put_admin_enterprises_x_limits_x_externalnetworks_x_ips_x
      request :put_admin_enterprises_x_properties
      request :put_admin_enterprises_x_users_x
      request :put_admin_publiccloudregions_x
      request :put_admin_publiccloudregions_x_remoteservices_x
      request :put_admin_roles_x
      request :put_admin_rolesldap_x
      request :put_admin_scopes_x
      request :put_cloud_locations_x_firewalls_x
      request :put_cloud_locations_x_firewalls_x_rules
      request :put_cloud_locations_x_loadbalancers_x
      request :put_cloud_locations_x_loadbalancers_x_healthchecks_x
      request :put_cloud_locations_x_loadbalancers_x_routingrules_x
      request :put_cloud_locations_x_loadbalancers_x_virtualmachines
      request :put_cloud_virtualdatacenters_x
      request :put_cloud_virtualdatacenters_x_action_defaultvlan
      request :put_cloud_virtualdatacenters_x_disks_x
      request :put_cloud_virtualdatacenters_x_privatenetworks_x
      request :put_cloud_virtualdatacenters_x_publicips_purchased_x
      request :put_cloud_virtualdatacenters_x_publicips_topurchase_x
      request :put_cloud_virtualdatacenters_x_virtualappliances_x
      request :put_cloud_virtualdatacenters_x_virtualappliances_x_layers_x
      request :put_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x
      request :put_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_firewalls
      request :put_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_metadata
      request :put_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_state
      request :put_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_storage_disks
      request :put_cloud_virtualdatacenters_x_virtualappliances_x_virtualmachines_x_storage_volumes
      request :put_cloud_virtualdatacenters_x_volumes_x
      request :put_config_categories_x
      request :put_config_costcodes_x
      request :put_config_costcodes_x_currencies
      request :put_config_costcodes_x_currencies_x
      request :put_config_currencies_x
      request :put_config_pricingtemplates_x
      request :put_config_pricingtemplates_x_costcodes
      request :put_config_pricingtemplates_x_costcodes_x
      request :put_config_pricingtemplates_x_tiers
      request :put_config_pricingtemplates_x_tiers_x
      request :put_config_properties
      request :put_config_properties_x

      class Real
        def initialize(options={})
          @abiquo_username = options[:abiquo_username]
          @abiquo_password = options[:abiquo_password]
          
          @api_path = URI.parse(options[:abiquo_api_url]).path

          @connection = Fog::Core::Connection.new(options[:abiquo_api_url], options[:abiquo_persistent], {:ssl_verify_peer => false})

          loginresp = request(
            :expects  => [200],
            :method   => 'GET',
            :path     => '/login',
            :accept   => 'application/vnd.abiquo.user+json'
            )
          @enterprise = loginresp['links'].select {|l| l['rel'] == 'enterprise'}.first
          @user = loginresp

          propsreq = request(
            :expects  => [200],
            :method   => 'GET',
            :path     => '/config/properties',
            :accept   => 'application/vnd.abiquo.systemproperties+json'
            )
          @config_properties = propsreq
        end

        def reload
          @connection.reset
        end

        def request(params)
          params.reject!{|k,v| v.nil?}

          headers={}
          headers.merge!('Accept' => params.delete(:accept)) if params.has_key?(:accept)
          headers.merge!('Content-Type' => params.delete(:content)) if params.has_key?(:content)

          # Only basic-auth is supported at the moment, it would be nice auth by cookie
          headers.merge!({'Authorization' => "Basic #{Base64.encode64(@abiquo_username+":"+@abiquo_password).delete("\r\n")}"})
          
          params[:headers] = headers
          
          params[:path].gsub!(/^.*#{@api_path}/, "") if params[:path].include?(@api_path)
          
          response = issue_request(params)
          response = Fog::JSON.decode(response.body) unless response.body.empty?

          if not response['links'].nil? and response['links'].select {|l| l['rel'].eql? "next" }.count > 0
            items = []
            items = items + response['collection'] if not response['collection'].nil?
            
            loop do
              next_url = response['links'].select {|l| l['rel'].eql? "next" }.first['href']
              params[:path] = next_url.gsub!(/^.*#{@api_path}/, "") if next_url.include?(@api_path)
              params[:headers] = headers
              response = issue_request(params)
              response = Fog::JSON.decode(response.body) unless response.body.empty?
              items = items + response['collection'] if not response['collection'].nil?
              
              break if response['links'].select {|l| l['rel'].eql? "next" }.count == 0
            end

            items
          else
            if not response['collection'].nil?
              response['collection']
            else
              response.nil? ? nil : response
            end
          end
        end

        def issue_request(options)
          begin
            options[:path] = @api_path + options[:path]
            resp = @connection.request(options)

            if resp.data['status'] == 204
              nil
            else
              resp
            end
          rescue Excon::Errors::HTTPStatusError => error
            case error.response.status
            when 401
              raise Fog::Compute::Abiquo::InvalidCredentials, "Wrong username or password"
            when 403
              raise Fog::Compute::Abiquo::Forbidden, "Not Authorized"
            when 406
              raise Fog::Compute::Abiquo::BadRequest, "Bad request"
            when 415
              raise Fog::Compute::Abiquo::UnsupportedMediaType, "Unsupported mediatype"
            when 409
              begin
                error_response = Fog::JSON.decode(error.response.body)

                error_code = error_response['collection'][0]['code']
                error_text = error_response['collection'][0]['message']

                raise Fog::Compute::Abiquo::Error, "#{error_code} - #{error_text}"
              rescue
                raise Fog::Compute::Abiquo::Error, error.response.body
              end
            else
              raise Fog::Compute::Abiquo::Error, error.response.body              
            end
          end
        end

        def enterprise
          @enterprise || {}
        end

        def user
          @user || {}
        end

        def config_properties
          @config_properties || {}
        end
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
