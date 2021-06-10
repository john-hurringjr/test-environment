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
  Shared VPC Host - Dev
 *****************************************/

resource "google_compute_network" "dev_vpc" {
  project                         = module.shared_vpc_host_project_dev.project_id
  name                            = "dev-vpc"
  routing_mode                    = "GLOBAL"
  auto_create_subnetworks         = false
}

module "dev_vpc_region_1_subnet_1" {
  source                = "github.com/john-hurringjr/test-modules//networking/subnet/generic?ref=master"
  project_id            = module.shared_vpc_host_project_dev.project_id
  network_self_link     = google_compute_network.dev_vpc.self_link
  network_name          = google_compute_network.dev_vpc.name
  region                = var.region_1
  cidr                  = var.development_vpc_region_1_cidr
  vpc_flow_log_interval = var.shared_vpc_flow_log_interval
  vpc_flow_log_sampling = var.shared_vpc_flow_log_sampling
  subnet_number         = "1"
}

module "dev_vpc_region_2_subnet_1" {
  source                = "github.com/john-hurringjr/test-modules//networking/subnet/generic?ref=master"
  project_id            = module.shared_vpc_host_project_dev.project_id
  network_self_link     = google_compute_network.dev_vpc.self_link
  network_name          = google_compute_network.dev_vpc.name
  region                = var.region_2
  cidr                  = var.development_vpc_region_2_cidr
  vpc_flow_log_interval = var.shared_vpc_flow_log_interval
  vpc_flow_log_sampling = var.shared_vpc_flow_log_sampling
  subnet_number         = "1"
}

module "dev_vpc_firewall_allow_iap_all" {
  source            = "github.com/john-hurringjr/test-modules//networking/firewall-rules/all/allow-ingress-iap?ref=master"
  project_id        = module.shared_vpc_host_project_dev.project_id
  network_self_link = google_compute_network.dev_vpc.self_link
  network_name      = google_compute_network.dev_vpc.name
}

module "dev_vpc_firewall_allow_rfc1918_all" {
  source            = "github.com/john-hurringjr/test-modules//networking/firewall-rules/all/allow-ingress-rfc1918?ref=master"
  project_id        = module.shared_vpc_host_project_dev.project_id
  network_self_link = google_compute_network.dev_vpc.self_link
  network_name      = google_compute_network.dev_vpc.name
}

module "dev_vpc_private_apis_dns" {
  source            = "github.com/john-hurringjr/test-modules//networking/dns/internal-private-apis?ref=master"
  project_id        = module.shared_vpc_host_project_dev.project_id
  network_self_link = google_compute_network.dev_vpc.self_link
}

module "dev_vpc_private_apis_routing" {
  source            = "github.com/john-hurringjr/test-modules//networking/routing/private-apis?ref=master"
  project_id        = module.shared_vpc_host_project_dev.project_id
  network_self_link = google_compute_network.dev_vpc.self_link
}

/******************************************
  Cloud NAT - Dev
 *****************************************/
module "dev_vpc_cloud_nat_region_1" {
  source                  = "github.com/john-hurringjr/test-modules//networking/nat/auto-ip-all-region-subnets?ref=master"
  project_id              = module.shared_vpc_host_project_dev.project_id
  network_self_link       = google_compute_network.dev_vpc.self_link
  network_name            = google_compute_network.dev_vpc.name
  cloud_router_asn_number = var.dev_vpc_cloud_nat_region_1_router_asn
  nat_region              = var.region_1
}

module "dev_vpc_cloud_nat_region_2" {
  source                  = "github.com/john-hurringjr/test-modules//networking/nat/auto-ip-all-region-subnets?ref=master"
  project_id              = module.shared_vpc_host_project_dev.project_id
  network_self_link       = google_compute_network.dev_vpc.self_link
  network_name            = google_compute_network.dev_vpc.name
  cloud_router_asn_number = var.dev_vpc_cloud_nat_region_2_router_asn
  nat_region              = var.region_2
}

/******************************************
  GKE Subnet - Dev
 *****************************************/

module "dev_vpc_region_2_gke_subnet_1" {
  source                  = "github.com/john-hurringjr/test-modules//networking/subnet/gke?ref=master"
  project_id              = module.shared_vpc_host_project_dev.project_id
  network_self_link       = google_compute_network.dev_vpc.self_link
  network_name            = google_compute_network.dev_vpc.name
  region                  = var.region_2
  primary_cidr            = var.development_vpc_region_1_gke_primary_cidr
  alias_gke_pod_cidr      = var.development_vpc_region_1_gke_alias_gke_pod_cidr
  alias_gke_service_cidr  = var.development_vpc_region_1_gke_alias_gke_service_cidr
  vpc_flow_log_interval   = "INTERVAL_5_SEC"
  vpc_flow_log_sampling   = 1
  subnet_number           = "gke-1"
}


/******************************************
  Shared VPC Host - Prod
 *****************************************/

//resource "google_compute_network" "prod_vpc" {
//  project                         = module.shared_vpc_host_project_prod.project_id
//  name                            = "prod-vpc"
//  routing_mode                    = "GLOBAL"
//  auto_create_subnetworks         = false
//}
//
//module "prod_vpc_region_1_subnet_1" {
//  source                = "github.com/john-hurringjr/test-modules/networking/subnet/generic"
//  project_id            = module.shared_vpc_host_project_prod.project_id
//  network_self_link     = google_compute_network.prod_vpc.self_link
//  network_name          = google_compute_network.prod_vpc.name
//  region                = var.region_1
//  cidr                  = var.production_vpc_region_1_cidr
//  vpc_flow_log_interval = var.shared_vpc_flow_log_interval
//  vpc_flow_log_sampling = var.shared_vpc_flow_log_sampling
//  subnet_number         = "1"
//}
//
//module "prod_vpc_region_2_subnet_1" {
//  source                = "github.com/john-hurringjr/test-modules/networking/subnet/generic"
//  project_id            = module.shared_vpc_host_project_prod.project_id
//  network_self_link     = google_compute_network.prod_vpc.self_link
//  network_name          = google_compute_network.prod_vpc.name
//  region                = var.region_2
//  cidr                  = var.production_vpc_region_2_cidr
//  vpc_flow_log_interval = var.shared_vpc_flow_log_interval
//  vpc_flow_log_sampling = var.shared_vpc_flow_log_sampling
//  subnet_number         = "1"
//}
//
//module "prod_vpc_firewall_allow_iap_all" {
//  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-ingress-iap"
//  project_id        = module.shared_vpc_host_project_prod.project_id
//  network_self_link = google_compute_network.prod_vpc.self_link
//  network_name      = google_compute_network.prod_vpc.name
//}
//
//module "prod_vpc_firewall_allow_rfc1918_all" {
//  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-ingress-rfc1918"
//  project_id        = module.shared_vpc_host_project_prod.project_id
//  network_self_link = google_compute_network.prod_vpc.self_link
//  network_name      = google_compute_network.prod_vpc.name
//}
//
//module "prod_vpc_private_apis_dns" {
//  source            = "github.com/john-hurringjr/test-modules/networking/dns/internal-private-apis"
//  project_id        = module.shared_vpc_host_project_prod.project_id
//  network_self_link = google_compute_network.prod_vpc.self_link
//}
//
//module "prod_vpc_private_apis_routing" {
//  source            = "github.com/john-hurringjr/test-modules/networking/routing/private-apis"
//  project_id        = module.shared_vpc_host_project_prod.project_id
//  network_self_link = google_compute_network.prod_vpc.self_link
//}

/******************************************
  Cloud NAT - Prod
 *****************************************/
//module "prod_vpc_cloud_nat_region_1" {
//  source                  = "github.com/john-hurringjr/test-modules/networking/nat/auto-ip-all-region-subnets"
//  project_id              = module.shared_vpc_host_project_prod.project_id
//  network_self_link       = google_compute_network.prod_vpc.self_link
//  network_name            = google_compute_network.prod_vpc.name
//  cloud_router_asn_number = var.prod_vpc_cloud_nat_region_1_router_asn
//  nat_region              = var.region_1
//}
//
//module "prod_vpc_cloud_nat_region_2" {
//  source                  = "github.com/john-hurringjr/test-modules/networking/nat/auto-ip-all-region-subnets"
//  project_id              = module.shared_vpc_host_project_prod.project_id
//  network_self_link       = google_compute_network.prod_vpc.self_link
//  network_name            = google_compute_network.prod_vpc.name
//  cloud_router_asn_number = var.prod_vpc_cloud_nat_region_2_router_asn
//  nat_region              = var.region_2
//}