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
  Shared VPC Host
 *****************************************/

module "tf_project" {
  source                    = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access-2/shared-vpc-host"
  project_friendly_name     = "TF Project"
  unique_shared_id          = var.project_unique_shared_id
  environment               = "tf"
  folder_id                 = google_folder.ingress_egress.id
  billing_account_id        = var.billing_account_id
  label_business_unit       = "tf-prj"
  label_restrictions        = "none"
  network_viewer_group_id   = var.network_admins_group
  service_perimeter_name    = google_access_context_manager_service_perimeter.service_perimeter_configuration_tf_perimeter.name
}

/******************************************
  Restricted Shared VPC Host - Prod - VPC and Subnets
 *****************************************/
# Network
resource "google_compute_network" "tf_project_vpc" {
  project                         = module.tf_project.project_id
  name                            = "tf-vpc"
  routing_mode                    = "GLOBAL"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}

# Subnets
module "tf_vpc_subnet_1" {
  source                  = "github.com/john-hurringjr/test-modules/networking/subnet/gke"
  project                         = module.tf_project.project_id
  network_self_link       = google_compute_network.tf_project_vpc.self_link
  network_name            = google_compute_network.tf_project_vpc.name
  region                  = "us-central1"
  primary_cidr            = "10.0.0.0/19"
  alias_gke_pod_cidr      = "10.2.0.0/18"
  alias_gke_service_cidr  = "10.1.0.0/19"
  vpc_flow_log_interval   = "INTERVAL_5_MIN"
  vpc_flow_log_sampling   = 0.8
  subnet_number           = "1"
}

/******************************************
  Restricted Shared VPC Host - Prod - DNS & Routing
 *****************************************/
module "restricted_prod_vpc_restricted_apis_dns" {
  source            = "github.com/john-hurringjr/test-modules/networking/dns/internal-restricted-apis"
  project                         = module.tf_project.project_id
  network_self_link = google_compute_network.tf_project_vpc.self_link
}

module "restricted_prod_vpc_restricted_apis_routing" {
  source            = "github.com/john-hurringjr/test-modules/networking/routing/restricted-apis"
  project                         = module.tf_project.project_id
  network_self_link = google_compute_network.tf_project_vpc.self_link
}

/******************************************
  Restricted Shared VPC Host - Non-Prod - Firewalls
 *****************************************/
# Allows ingress on 22, 3389, 443 on all VMs from all rfc1918
module "restricted_non_prod_vpc_firewall_allow_ingress_rfc1918_limited" {
  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-ingress-rfc1918-limited"
  project                         = module.tf_project.project_id
  network_self_link = google_compute_network.tf_project_vpc.self_link
  network_name      = google_compute_network.tf_project_vpc.name
}

module "restricted_on_prem_vpc_prod_firewall_allow_iap_all" {
  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-ingress-iap"
  project                         = module.tf_project.project_id
  network_self_link = google_compute_network.tf_project_vpc.self_link
  network_name      = google_compute_network.tf_project_vpc.name
}