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
  Variables for project creation
 *****************************************/

variable "unique_shared_id" {
  type = string
}

variable "billing_account_id" {}

/******************************************
  Regions & Zones
 *****************************************/

variable "region_1" {
  type    = string
  default = "us-east4"
}

variable "region_2" {
  type    = string
  default = "us-central1"
}

variable "region_1_zone_1" {
  type    = string
  default = "us-east4-b"
}

variable "region_1_zone_2" {
  type    = string
  default = "us-east4-c"
}

variable "region_2_zone_1" {
  type    = string
  default = "us-central1-c"
}

variable "region_2_zone_2" {
  type    = string
  default = "us-central1-f"
}

/******************************************
  On Premise Variables
 *****************************************/

variable "on_premise_project_id" {}

variable "vpn_on_prem_transit_east_shared_secret_tunnel_1" {}
variable "vpn_on_prem_transit_east_shared_secret_tunnel_2" {}

variable "vpn_on_prem_transit_central_shared_secret_tunnel_1" {}
variable "vpn_on_prem_transit_central_shared_secret_tunnel_2" {}

variable "nat_instance_tag" {
  default = "allow-default-internet-gateway-access"
}

/******************************************
  Org Sink Variables
 *****************************************/

variable "gcs_org_sink_bucket_name" {
  type = string
}

variable "bigquery_org_sink_name" {
  type    = string
  default = "bigquery-org-sink"
}

variable "bigquery_org_sink_data_set_id" {
  type    = string
  default = "org_sink"
}

variable "gcs_org_sink_name" {
  type    = string
  default = "gcs-org-sink"
}