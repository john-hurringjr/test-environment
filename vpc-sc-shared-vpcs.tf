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

# VPC Service Controls
//variable "vpc_sc_transit_vpc_region_1_cidr" {}
//variable "vpc_sc_transit_vpc_region_2_cidr" {}
//
//variable "vpc_sc_dev_vpc_region_1_cidr" {}
//variable "vpc_sc_dev_vpc_region_2_cidr" {}
//
//variable "vpc_sc_prod_vpc_region_1_cidr" {}
//variable "vpc_sc_prod_vpc_region_2_cidr" {}

///******************************************
//  Shared VPC Host - Transit
// *****************************************/
//
//resource "google_compute_network" "vpc_sc_transit_vpc" {
//  project                         = module.vpc_sc_shared_vpc_host_project_transit.project_id
//  name                            = "vpc-sc-transit-vpc"
//  routing_mode                    = "GLOBAL"
//  auto_create_subnetworks         = false
//  delete_default_routes_on_create = true
//}
//
//module "vpc_sc_transit_vpc_region_1_subnet" {
//  source                = "github.com/john-hurringjr/test-modules/networking/subnet/generic"
//  project_id            = module.vpc_sc_shared_vpc_host_project_transit.project_id
//  network_self_link     = google_compute_network.vpc_sc_transit_vpc.self_link
//  network_name          = google_compute_network.vpc_sc_transit_vpc.name
//  region                = var.region_1
//  cidr                  = var.transit_vpc_region_1_cidr
//  vpc_flow_log_interval = var.shared_vpc_flow_log_interval
//  vpc_flow_log_sampling = var.shared_vpc_flow_log_sampling
//  subnet_number         = "1"
//}
//
//module "vpc_sc_transit_vpc_region_2_subnet" {
//  source                = "github.com/john-hurringjr/test-modules/networking/subnet/generic"
//  project_id            = module.vpc_sc_shared_vpc_host_project_transit.project_id
//  network_self_link     = google_compute_network.vpc_sc_transit_vpc.self_link
//  network_name          = google_compute_network.vpc_sc_transit_vpc.name
//  region                = var.region_2
//  cidr                  = var.transit_vpc_region_2_cidr
//  vpc_flow_log_interval = var.shared_vpc_flow_log_interval
//  vpc_flow_log_sampling = var.shared_vpc_flow_log_sampling
//  subnet_number         = "1"
//}
//
//module "vpc_sc_transit_vpc_firewall_deny_all_egress" {
//  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/deny-egress-all-port-proto"
//  project_id        = module.vpc_sc_shared_vpc_host_project_transit.project_id
//  network_self_link = google_compute_network.vpc_sc_transit_vpc.self_link
//  network_name      = google_compute_network.vpc_sc_transit_vpc.name
//}
//
///******************************************
//  Shared VPC Host - Dev
// *****************************************/
//
//resource "google_compute_network" "vpc_sc_dev_vpc" {
//  project                         = module.vpc_sc_shared_vpc_host_project_dev.project_id
//  name                            = "vpc-sc-dev-vpc"
//  routing_mode                    = "GLOBAL"
//  auto_create_subnetworks         = false
//  delete_default_routes_on_create = true
//}
//
//module "vpc_sc_dev_vpc_region_1_subnet_1" {
//  source                = "github.com/john-hurringjr/test-modules/networking/subnet/generic"
//  project_id            = module.vpc_sc_shared_vpc_host_project_dev.project_id
//  network_self_link     = google_compute_network.vpc_sc_dev_vpc.self_link
//  network_name          = google_compute_network.vpc_sc_dev_vpc.name
//  region                = var.region_1
//  cidr                  = var.development_vpc_region_1_cidr
//  vpc_flow_log_interval = var.shared_vpc_flow_log_interval
//  vpc_flow_log_sampling = var.shared_vpc_flow_log_sampling
//  subnet_number         = "1"
//}
//
//module "vpc_sc_dev_vpc_region_2_subnet_1" {
//  source                = "github.com/john-hurringjr/test-modules/networking/subnet/generic"
//  project_id            = module.vpc_sc_shared_vpc_host_project_dev.project_id
//  network_self_link     = google_compute_network.vpc_sc_dev_vpc.self_link
//  network_name          = google_compute_network.vpc_sc_dev_vpc.name
//  region                = var.region_2
//  cidr                  = var.development_vpc_region_2_cidr
//  vpc_flow_log_interval = var.shared_vpc_flow_log_interval
//  vpc_flow_log_sampling = var.shared_vpc_flow_log_sampling
//  subnet_number         = "1"
//}
//
//module "vpc_sc_dev_vpc_firewall_allow_iap_all" {
//  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-ingress-iap"
//  project_id        = module.vpc_sc_shared_vpc_host_project_dev.project_id
//  network_self_link = google_compute_network.vpc_sc_dev_vpc.self_link
//  network_name      = google_compute_network.vpc_sc_dev_vpc.name
//}
//
//module "vpc_sc_dev_vpc_firewall_allow_rfc1918_all" {
//  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-ingress-rfc1918"
//  project_id        = module.vpc_sc_shared_vpc_host_project_dev.project_id
//  network_self_link = google_compute_network.vpc_sc_dev_vpc.self_link
//  network_name      = google_compute_network.vpc_sc_dev_vpc.name
//}
//
//module "vpc_sc_dev_vpc_restricted_apis_dns" {
//  source            = "github.com/john-hurringjr/test-modules/networking/dns/internal-restricted-apis"
//  project_id        = module.vpc_sc_shared_vpc_host_project_dev.project_id
//  network_self_link = google_compute_network.vpc_sc_dev_vpc.self_link
//}
//
//module "vpc_sc_dev_vpc_restricted_apis_routing" {
//  source            = "github.com/john-hurringjr/test-modules/networking/routing/restricted-apis"
//  project_id        = module.vpc_sc_shared_vpc_host_project_dev.project_id
//  network_self_link = google_compute_network.vpc_sc_dev_vpc.self_link
//}
//
///******************************************
//  Peering - Dev & Transit
// *****************************************/
//
//resource "google_compute_network_peering" "vpc_sc_transit_vpc_to_dev_vpc" {
//  provider              = google-beta
//  name                  = "vpc-sc-transit-to-dev-peering"
//  network               = google_compute_network.vpc_sc_transit_vpc.id
//  peer_network          = google_compute_network.vpc_sc_dev_vpc.id
//  export_custom_routes  = true
//}
//
//resource "google_compute_network_peering" "vpc_sc_dev_vpc_to_transit_vpc" {
//  provider              = google-beta
//  name                  = "vpc-sc-dev-to-transit-peering"
//  network               = google_compute_network.vpc_sc_dev_vpc.id
//  peer_network          = google_compute_network.vpc_sc_transit_vpc.id
//  import_custom_routes  = true
//}
//
///******************************************
//  Shared VPC Host - Prod
// *****************************************/
//
//resource "google_compute_network" "vpc_sc_prod_vpc" {
//  project                         = module.vpc_sc_shared_vpc_host_project_prod.project_id
//  name                            = "vpc-sc-prod-vpc"
//  routing_mode                    = "GLOBAL"
//  auto_create_subnetworks         = false
//  delete_default_routes_on_create = true
//}
//
//module "vpc_sc_prod_vpc_region_1_subnet_1" {
//  source                = "github.com/john-hurringjr/test-modules/networking/subnet/generic"
//  project_id            = module.vpc_sc_shared_vpc_host_project_prod.project_id
//  network_self_link     = google_compute_network.vpc_sc_prod_vpc.self_link
//  network_name          = google_compute_network.vpc_sc_prod_vpc.name
//  region                = var.region_1
//  cidr                  = var.production_vpc_region_1_cidr
//  vpc_flow_log_interval = var.shared_vpc_flow_log_interval
//  vpc_flow_log_sampling = var.shared_vpc_flow_log_sampling
//  subnet_number         = "1"
//}
//
//module "vpc_sc_prod_vpc_region_2_subnet_1" {
//  source                = "github.com/john-hurringjr/test-modules/networking/subnet/generic"
//  project_id            = module.vpc_sc_shared_vpc_host_project_prod.project_id
//  network_self_link     = google_compute_network.vpc_sc_prod_vpc.self_link
//  network_name          = google_compute_network.vpc_sc_prod_vpc.name
//  region                = var.region_2
//  cidr                  = var.production_vpc_region_2_cidr
//  vpc_flow_log_interval = var.shared_vpc_flow_log_interval
//  vpc_flow_log_sampling = var.shared_vpc_flow_log_sampling
//  subnet_number         = "1"
//}
//
//module "vpc_sc_prod_vpc_firewall_allow_iap_all" {
//  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-ingress-iap"
//  project_id        = module.vpc_sc_shared_vpc_host_project_prod.project_id
//  network_self_link = google_compute_network.vpc_sc_prod_vpc.self_link
//  network_name      = google_compute_network.vpc_sc_prod_vpc.name
//}
//
//module "vpc_sc_prod_vpc_firewall_allow_rfc1918_all" {
//  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-ingress-rfc1918"
//  project_id        = module.vpc_sc_shared_vpc_host_project_prod.project_id
//  network_self_link = google_compute_network.vpc_sc_prod_vpc.self_link
//  network_name      = google_compute_network.vpc_sc_prod_vpc.name
//}
//
//module "vpc_sc_prod_vpc_restricted_apis_dns" {
//  source            = "github.com/john-hurringjr/test-modules/networking/dns/internal-restricted-apis"
//  project_id        = module.vpc_sc_shared_vpc_host_project_prod.project_id
//  network_self_link = google_compute_network.vpc_sc_prod_vpc.self_link
//}
//
//module "vpc_sc_prod_vpc_restricted_apis_routing" {
//  source            = "github.com/john-hurringjr/test-modules/networking/routing/restricted-apis"
//  project_id        = module.vpc_sc_shared_vpc_host_project_prod.project_id
//  network_self_link = google_compute_network.vpc_sc_prod_vpc.self_link
//}
//
///******************************************
//  Peering - Prod & Transit
// *****************************************/
//
//resource "google_compute_network_peering" "vpc_sc_transit_vpc_to_prod_vpc" {
//  depends_on            = [google_compute_network_peering.vpc_sc_dev_vpc_to_transit_vpc, google_compute_network_peering.vpc_sc_transit_vpc_to_dev_vpc]
//  provider              = google-beta
//  name                  = "vpc-sc-transit-to-prod-peering"
//  network               = google_compute_network.vpc_sc_transit_vpc.id
//  peer_network          = google_compute_network.vpc_sc_prod_vpc.id
//  export_custom_routes  = true
//}
//
//resource "google_compute_network_peering" "vpc_sc_prod_vpc_to_transit_vpc" {
//  depends_on            = [google_compute_network_peering.vpc_sc_dev_vpc_to_transit_vpc, google_compute_network_peering.vpc_sc_transit_vpc_to_dev_vpc, google_compute_network_peering.vpc_sc_transit_vpc_to_prod_vpc]
//  provider              = google-beta
//  name                  = "vpc-sc-prod-to-transit-peering"
//  network               = google_compute_network.vpc_sc_prod_vpc.id
//  peer_network          = google_compute_network.vpc_sc_transit_vpc.id
//  import_custom_routes  = true
//}

