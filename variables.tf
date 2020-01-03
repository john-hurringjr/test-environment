/**
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/******************************************
  Variables
 *****************************************/
variable "organization_id" {}
variable "terraform_service_account" {}
variable "domain_identity_primary" {}
variable "domain_identity_secondary" {}
variable "project_unique_shared_id" {}
variable "billing_account_id" {}

/******************************************
  Variables of groups
 *****************************************/
variable "organization_admins_group" {}
variable "network_admins_group" {}
variable "security_admins_group" {}
variable "operations_admins_group" {}
variable "sre_group" {}
variable "billing_admins_group" {}
variable "external_users_os_login_group" {}
variable "application_1_admins_group" {}
variable "application_1_developer_group" {}
variable "billing_users_group" {}

/******************************************
  Regions & Zones
 *****************************************/
variable "region_1" {}
variable "region_1_zone_1" {}
variable "region_1_zone_2" {}

variable "region_2" {}
variable "region_2_zone_1" {}
variable "region_2_zone_2" {}

/******************************************
  On Premise Variables
 *****************************************/
variable "on_premise_project_id" {}

variable "vpn_on_prem_transit_region_1_shared_secret_tunnel_1" {}
variable "vpn_on_prem_transit_region_1_shared_secret_tunnel_2" {}

variable "vpn_on_prem_transit_region_2_shared_secret_tunnel_1" {}
variable "vpn_on_prem_transit_region_2_shared_secret_tunnel_2" {}

variable "nat_instance_tag" {}

variable "on_prem_vpc_region_1_cidr" {}
variable "on_prem_vpc_region_2_cidr" {}
variable "on_prem_vpc_flow_log_interval" {}
variable "on_prem_vpc_flow_log_sampling" {}

#HA VPN
variable "on_prem_vpc_router_region_1_asn" {}
variable "on_prem_vpc_router_region_2_asn" {}
variable "transit_vpc_router_region_1_asn" {}
variable "transit_vpc_router_region_2_asn" {}

# Cloud NAT
variable "on_prem_vpc_cloud_nat_region_1_router_asn" {}
variable "on_prem_vpc_cloud_nat_region_2_router_asn" {}


/******************************************
  Org Sink Variables
 *****************************************/
variable "gcs_org_sink_bucket_name" {}
variable "bigquery_org_sink_name" {}
variable "bigquery_org_sink_data_set_id" {}
variable "gcs_org_sink_name" {}

/******************************************
  Billing Export Variables
 *****************************************/
variable "billing_export_bigquery_dataset_location" {}
variable "billing_export_bigquery_dataset_id" {}
variable "billing_export_bigquery_dataset_friendly_name" {}
variable "billing_export_bigquery_sink_name" {}

/******************************************
  Shared VPCs Variables
 *****************************************/
variable "transit_vpc_region_1_cidr" {}
variable "transit_vpc_region_2_cidr" {}

variable "development_vpc_region_1_cidr" {}
variable "development_vpc_region_2_cidr" {}

variable "production_vpc_region_1_cidr" {}
variable "production_vpc_region_2_cidr" {}

variable "shared_vpc_flow_log_interval" {}
variable "shared_vpc_flow_log_sampling" {}

variable "dev_vpc_cloud_nat_region_1_router_asn" {}
variable "dev_vpc_cloud_nat_region_2_router_asn" {}

variable "prod_vpc_cloud_nat_region_1_router_asn" {}
variable "prod_vpc_cloud_nat_region_2_router_asn" {}


/******************************************
  VPC Service Controls
 *****************************************/
variable "vpc_service_controls_unique_id" {}

variable "vpc_sc_troubleshooting_user_id" {}