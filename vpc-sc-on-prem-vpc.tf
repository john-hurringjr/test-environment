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

resource "google_compute_network" "vpc_sc_on_prem_vpc" {
  depends_on                      = [google_project_service.on_prem_project_enable_compute_api]
  project                         = google_project.on_premise.project_id
  name                            = "vpc-sc-on-prem-vpc"
  routing_mode                    = "GLOBAL"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}

module "vpc_sc_on_prem_vpc_region_1_subnet" {
  source                = "github.com/john-hurringjr/test-modules/networking/subnet/generic"
  project_id            = google_project.on_premise.id
  network_self_link     = google_compute_network.vpc_sc_on_prem_vpc.self_link
  network_name          = google_compute_network.vpc_sc_on_prem_vpc.name
  region                = var.region_1
  cidr                  = var.on_prem_vpc_region_1_cidr
  vpc_flow_log_interval = var.on_prem_vpc_flow_log_interval
  vpc_flow_log_sampling = var.on_prem_vpc_flow_log_sampling
  subnet_number         = "1"
}

module "vpc_sc_on_prem_vpc_region_2_subnet" {
  source                = "github.com/john-hurringjr/test-modules/networking/subnet/generic"
  project_id            = google_project.on_premise.id
  network_self_link     = google_compute_network.vpc_sc_on_prem_vpc.self_link
  network_name          = google_compute_network.vpc_sc_on_prem_vpc.name
  region                = var.region_2
  cidr                  = var.on_prem_vpc_region_2_cidr
  vpc_flow_log_interval = var.on_prem_vpc_flow_log_interval
  vpc_flow_log_sampling = var.on_prem_vpc_flow_log_sampling
  subnet_number         = "1"
}

module "vpc_sc_on_prem_vpc_firewall_allow_iap_all" {
  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-ingress-iap"
  project_id        = google_project.on_premise.id
  network_self_link = google_compute_network.vpc_sc_on_prem_vpc.self_link
  network_name      = google_compute_network.vpc_sc_on_prem_vpc.name
}

module "vpc_sc_on_prem_vpc_firewall_allow_rfc1918_all" {
  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-ingress-rfc1918"
  project_id        = google_project.on_premise.id
  network_self_link = google_compute_network.vpc_sc_on_prem_vpc.self_link
  network_name      = google_compute_network.vpc_sc_on_prem_vpc.name
}
/******************************************
  On Prem HA VPN with Transit VPC - Region 1
 *****************************************/

//module "vpc_sc_ha_vpn_on_prem_with_transit_vpc_region_1" {
//  source                    = "github.com/john-hurringjr/test-modules/networking/vpn-ha-gcp"
//  project_1_id              = google_project.on_premise.project_id
//  network_1_self_link       = google_compute_network.vpc_sc_on_prem_vpc.self_link
//  network_1_name            = google_compute_network.vpc_sc_on_prem_vpc.name
//  network_1_router_bgp_asn  = var.on_prem_vpc_router_region_1_asn
//  project_2_id              = module.vpc_sc_shared_vpc_host_project_transit.project_id
//  network_2_self_link       = google_compute_network.vpc_sc_transit_vpc.self_link
//  network_2_name            = google_compute_network.vpc_sc_transit_vpc.name
//  network_2_router_bgp_asn  = var.transit_vpc_router_region_1_asn
//  shared_secret_tunnel_1    = var.vpn_on_prem_transit_region_1_shared_secret_tunnel_1
//  shared_secret_tunnel_2    = var.vpn_on_prem_transit_region_1_shared_secret_tunnel_2
//  region                    = var.region_1
//}
//
//module "vpc_sc_ha_vpn_on_prem_with_transit_vpc_region_2" {
//  source                    = "github.com/john-hurringjr/test-modules/networking/vpn-ha-gcp"
//  project_1_id              = google_project.on_premise.project_id
//  network_1_self_link       = google_compute_network.vpc_sc_on_prem_vpc.self_link
//  network_1_name            = google_compute_network.vpc_sc_on_prem_vpc.name
//  network_1_router_bgp_asn  = var.on_prem_vpc_router_region_2_asn
//  project_2_id              = module.vpc_sc_shared_vpc_host_project_transit.project_id
//  network_2_self_link       = google_compute_network.vpc_sc_transit_vpc.self_link
//  network_2_name            = google_compute_network.vpc_sc_transit_vpc.name
//  network_2_router_bgp_asn  = var.transit_vpc_router_region_2_asn
//  shared_secret_tunnel_1    = var.vpn_on_prem_transit_region_2_shared_secret_tunnel_1
//  shared_secret_tunnel_2    = var.vpn_on_prem_transit_region_2_shared_secret_tunnel_2
//  region                    = var.region_2
//}

/******************************************
  Set Up Cloud NAT
 *****************************************/
module "vpc_sc_on_prem_cloud_nat_region_1" {
  source                  = "github.com/john-hurringjr/test-modules/networking/nat/auto-ip-all-region-subnets"
  project_id              = google_project.on_premise.project_id
  network_self_link       = google_compute_network.vpc_sc_on_prem_vpc.self_link
  network_name            = google_compute_network.vpc_sc_on_prem_vpc.name
  cloud_router_asn_number = var.on_prem_vpc_cloud_nat_region_1_router_asn
  nat_region              = var.region_1
}

module "vpc_sc_on_prem_cloud_nat_region_2" {
  source                  = "github.com/john-hurringjr/test-modules/networking/nat/auto-ip-all-region-subnets"
  project_id              = google_project.on_premise.project_id
  network_self_link       = google_compute_network.vpc_sc_on_prem_vpc.self_link
  network_name            = google_compute_network.vpc_sc_on_prem_vpc.name
  cloud_router_asn_number = var.on_prem_vpc_cloud_nat_region_2_router_asn
  nat_region              = var.region_2
}

/******************************************
  Set Up VM as NAT Gateway
 *****************************************/

//module "vpc_sc_simple_nat_instance_region_1" {
//  source                = "github.com/john-hurringjr/test-modules/gce-instances/simplenat"
//  project_id            = google_project.on_premise.project_id
//  subnet_self_link      = module.vpc_sc_on_prem_vpc_region_1_subnet.subnet_self_link
//  zone                  = var.region_1_zone_1
//  instance_name         = "nat-gateway-instance"
//  machine_type          = "n1-standard-4"
//  instance_network_tag  = var.nat_instance_tag
//}
//
//resource "google_compute_route" "vpc_sc_default_route_to_nat_instance" {
//  depends_on            = [module.vpc_sc_simple_nat_instance_region_1]
//  project               = google_project.on_premise.project_id
//  dest_range            = "0.0.0.0/0"
//  name                  = "default-route-to-nat-instance"
//  network               = google_compute_network.vpc_sc_on_prem_vpc.name
//  next_hop_instance     = module.vpc_sc_simple_nat_instance_region_1.instance_self_link
//  priority              = 1000
//}
//
//resource "google_compute_route" "vpc_sc_nat_instance_special_route_to_internet_gw" {
//  depends_on        = [module.vpc_sc_simple_nat_instance_region_1]
//  project           = google_project.on_premise.project_id
//  dest_range        = "0.0.0.0/0"
//  name              = "nat-instance-special-route"
//  network           = google_compute_network.vpc_sc_on_prem_vpc.name
//  next_hop_gateway  = "default-internet-gateway"
//  priority          = 100
//  tags              = [var.nat_instance_tag]
//}