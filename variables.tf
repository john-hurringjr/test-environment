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

variable "organization_id" {
  type = string
}

variable "terraform_service_account" {
  type = string
}

variable "domain_identity_primary" {
  type = string
}

variable "domain_identity_secondary" {
  type = string
}

variable "project_unique_shared_id" {
  type = string
}

variable "billing_account_id" {}

/******************************************
  Variables of groups
 *****************************************/

variable "organization_admins_group" {
  type = string
}

variable "network_admins_group" {
  type = string
}

variable "security_admins_group" {
  type = string
}

variable "operations_admins_group" {
  type = string
}

variable "sre_group" {
  type = string
}

variable "billing_admins_group" {
  type = string
}

variable "external_users_os_login_group" {
  type = string
}

variable "application_1_admins_group" {
  type = string
}

variable "application_1_developer_group" {
  type = string
}

variable "billing_users_group" {
  type = string
}

/******************************************
  Regions & Zones
 *****************************************/

variable "region_1" {
  type    = string
}

variable "region_2" {
  type    = string
}

variable "region_1_zone_1" {
  type    = string
}

variable "region_1_zone_2" {
  type    = string
}

variable "region_2_zone_1" {
  type    = string
}

variable "region_2_zone_2" {
  type    = string
}

/******************************************
  On Premise Variables
 *****************************************/
variable "on_premise_project_id" {}
variable "vpn_on_prem_transit_region_1_shared_secret_tunnel_1" {}
variable "vpn_on_prem_transit_region_1_shared_secret_tunnel_2" {}
variable "vpn_on_prem_transit_region_2_shared_secret_tunnel_1" {}
variable "vpn_on_prem_transit_region_2_shared_secret_tunnel_2" {}
variable "nat_instance_tag" {}

/******************************************
  Org Sink Variables
 *****************************************/

variable "gcs_org_sink_bucket_name" {
  type = string
}

variable "bigquery_org_sink_name" {
  type    = string
}

variable "bigquery_org_sink_data_set_id" {
  type    = string
}

variable "gcs_org_sink_name" {
  type    = string
}