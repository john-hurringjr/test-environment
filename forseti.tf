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

variable "gsuite_forseti_admin_email" {}
variable "domain_for_forseti" {}

/******************************************
  Forseti Project API Enablement
 *****************************************/

//resource "google_project_service" "forseti_project_enable_dns_api" {
//  depends_on          = [module.forseti_project]
//  project             = module.forseti_project.project_id
//  service             = "dns.googleapis.com"
//  disable_on_destroy  = false
//}
//
///******************************************
//  Forseti Closed Network
// *****************************************/
//
//resource "google_compute_network" "forseti_vpc" {
//  project       = module.shared_vpc_host_project_dev.project_id
//  name          = "forseti-vpc"
//  routing_mode  = "GLOBAL"
//
//  auto_create_subnetworks         = false
//  delete_default_routes_on_create = true
//}
//
//module "forseti_vpc_us_central1_subnet_1" {
//  source = "github.com/john-hurringjr/test-modules/networking/subnet/generic"
//
//  project_id        = module.forseti_project.project_id
//  network_self_link = google_compute_network.forseti_vpc.self_link
//  network_name      = google_compute_network.forseti_vpc.name
//
//  region  = "forseti"
//  cidr    = "192.168.0.0/30"
//
//  vpc_flow_log_interval = "INTERVAL_15_MIN"
//  vpc_flow_log_sampling = 0.2
//  subnet_number         = "1"
//
//}
//
//module "forseti_vpc_private_apis_dns" {
//  source = "github.com/john-hurringjr/test-modules/networking/dns/internal-private-apis"
//
//  project_id        = module.forseti_project.project_id
//  network_self_link = google_compute_network.forseti_vpc.self_link
//
//}
//
//module "forseti_vpc_private_apis_routing" {
//  source = "github.com/john-hurringjr/test-modules/networking/routing/private-apis"
//
//  project_id        = module.forseti_project.project_id
//  network_self_link = google_compute_network.forseti_vpc.self_link
//
//}
//
///******************************************
//  Forseti Install
// *****************************************/
//
//module "forseti_install" {
//  source  = "terraform-google-modules/forseti/google"
//  version = "~> 5.0.0"
//
//  gsuite_admin_email = var.gsuite_forseti_admin_email
//  domain             = var.domain_for_forseti
//  project_id         = module.forseti_project.project_id
//  org_id             = var.organization_id
//
//  bucket_cai_location     = "US"
//  storage_bucket_location = "US"
//  network                 = google_compute_network.forseti_vpc.self_link
//  network_project         = module.forseti_project.project_id
//  subnetwork              = module.forseti_vpc_us_central1_subnet_1.subnet_self_link
//  client_private          = true
//  cloudsql_private        = true
//
//}