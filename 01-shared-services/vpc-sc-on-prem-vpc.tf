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
  On Prem Network VPC SC
 *****************************************/

//resource "google_compute_network" "vpc_sc_on_prem_vpc" {
//  depends_on                      = [google_project_service.on_prem_project_enable_compute_api]
//  project                         = google_project.on_premise.project_id
//  name                            = "vpc-sc-on-prem-vpc"
//  routing_mode                    = "GLOBAL"
//  auto_create_subnetworks         = false
//  delete_default_routes_on_create = true
//}
//
//module "vpc_sc_on_prem_vpc_region_1_subnet" {
//  source                = "github.com/john-hurringjr/test-modules/networking/subnet/generic"
//  project_id            = google_project.on_premise.id
//  network_self_link     = google_compute_network.vpc_sc_on_prem_vpc.self_link
//  network_name          = google_compute_network.vpc_sc_on_prem_vpc.name
//  region                = var.region_1
//  cidr                  = var.on_prem_vpc_region_1_cidr
//  vpc_flow_log_interval = var.on_prem_vpc_flow_log_interval
//  vpc_flow_log_sampling = var.on_prem_vpc_flow_log_sampling
//  subnet_number         = "1"
//  private_google_access = "false"
//}
//
//module "vpc_sc_on_prem_vpc_region_2_subnet" {
//  source                = "github.com/john-hurringjr/test-modules/networking/subnet/generic"
//  project_id            = google_project.on_premise.id
//  network_self_link     = google_compute_network.vpc_sc_on_prem_vpc.self_link
//  network_name          = google_compute_network.vpc_sc_on_prem_vpc.name
//  region                = var.region_2
//  cidr                  = var.on_prem_vpc_region_2_cidr
//  vpc_flow_log_interval = var.on_prem_vpc_flow_log_interval
//  vpc_flow_log_sampling = var.on_prem_vpc_flow_log_sampling
//  subnet_number         = "1"
//  private_google_access = "false"
//}
//
//module "vpc_sc_on_prem_vpc_firewall_allow_iap_all" {
//  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-ingress-iap"
//  project_id        = google_project.on_premise.id
//  network_self_link = google_compute_network.vpc_sc_on_prem_vpc.self_link
//  network_name      = google_compute_network.vpc_sc_on_prem_vpc.name
//}
//
//module "vpc_sc_on_prem_vpc_firewall_allow_rfc1918_all" {
//  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-ingress-rfc1918"
//  project_id        = google_project.on_premise.id
//  network_self_link = google_compute_network.vpc_sc_on_prem_vpc.self_link
//  network_name      = google_compute_network.vpc_sc_on_prem_vpc.name
//}

/******************************************
  Set Up Cloud NAT
 *****************************************/
//module "vpc_sc_on_prem_cloud_nat_region_1" {
//  source                  = "github.com/john-hurringjr/test-modules/networking/nat/auto-ip-all-region-subnets"
//  project_id              = google_project.on_premise.project_id
//  network_self_link       = google_compute_network.vpc_sc_on_prem_vpc.self_link
//  network_name            = google_compute_network.vpc_sc_on_prem_vpc.name
//  cloud_router_asn_number = var.on_prem_vpc_cloud_nat_region_1_router_asn
//  nat_region              = var.region_1
//}
//
//module "vpc_sc_on_prem_cloud_nat_region_2" {
//  source                  = "github.com/john-hurringjr/test-modules/networking/nat/auto-ip-all-region-subnets"
//  project_id              = google_project.on_premise.project_id
//  network_self_link       = google_compute_network.vpc_sc_on_prem_vpc.self_link
//  network_name            = google_compute_network.vpc_sc_on_prem_vpc.name
//  cloud_router_asn_number = var.on_prem_vpc_cloud_nat_region_2_router_asn
//  nat_region              = var.region_2
//}

/******************************************
  Set Up Cloud DNS
 *****************************************/

//module "vpc_sc_on_prem_vpc_private_apis_dns" {
//  source            = "github.com/john-hurringjr/test-modules/networking/dns/internal-private-apis"
//  project_id        = google_project.on_premise.project_id
//  network_self_link = google_compute_network.vpc_sc_on_prem_vpc.self_link
//}

//module "vpc_sc_on_prem_vpc_restricted_apis_dns" {
//  source            = "github.com/john-hurringjr/test-modules/networking/dns/internal-restricted-apis"
//  project_id        = google_project.on_premise.project_id
//  network_self_link = google_compute_network.vpc_sc_on_prem_vpc.self_link
//}