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

variable "on_premise_project_id" {}

variable "on_premise_folder_id" {}

/******************************************
  On Prem Project
 *****************************************/

resource "google_project" "on_premise" {
  name            = "On Premise"
  project_id      = var.on_premise_project_id
  folder_id       = "folders/${var.on_premise_folder_id}"
  billing_account = var.billing_account_id
}

resource "google_project_iam_binding" "on_prem_owner" {
  project = google_project.on_premise.id
  members = ["group:${var.security_admins_group}", "serviceAccount:${var.terraform_service_account}"]
  role    = "roles/owner"
}

resource "google_project_service" "on_prem_project_enable_compute_api" {
  depends_on          = [google_project.on_premise]
  project             = google_project.on_premise.id
  service             = "compute.googleapis.com"
  disable_on_destroy  = false
}

resource "google_project_service" "on_prem_project_enable_dns_api" {
  depends_on          = [google_project.on_premise]
  project             = google_project.on_premise.id
  service             = "dns.googleapis.com"
  disable_on_destroy  = false
}

/******************************************
  Org Policy Exception for External IP
 *****************************************/

resource "google_project_organization_policy" "on_prem_external_ip_exception" {
  constraint = "compute.vmExternalIpAccess"
  project = google_project.on_premise.id

  list_policy {
    inherit_from_parent = false
    allow {
      all = true
    }

  }
}

/******************************************
  On Prem Network
 *****************************************/

resource "google_compute_network" "on_prem_vpc" {
  depends_on    = [google_project_service.on_prem_project_enable_compute_api]
  project       = google_project.on_premise.project_id
  name          = "on-prem-vpc"
  routing_mode  = "GLOBAL"

  auto_create_subnetworks = false

}

module "on_prem_vpc_us_east4_subnet" {

  source = "github.com/john-hurringjr/test-modules/networking/subnet/generic"

  project_id        = google_project.on_premise.id
  network_self_link = google_compute_network.on_prem_vpc.self_link
  network_name      = google_compute_network.on_prem_vpc.name

  region  = "us-east4"
  cidr    = "10.0.0.0/20"

  vpc_flow_log_interval = "INTERVAL_10_MIN"
  vpc_flow_log_sampling = 0.6
  subnet_number         = "1"

}

module "on_prem_vpc_us_central1_subnet" {

  source = "github.com/john-hurringjr/test-modules/networking/subnet/generic"

  project_id        = google_project.on_premise.id
  network_self_link = google_compute_network.on_prem_vpc.self_link
  network_name      = google_compute_network.on_prem_vpc.name

  region  = "us-central1"
  cidr    = "10.0.32.0/20"

  vpc_flow_log_interval = "INTERVAL_10_MIN"
  vpc_flow_log_sampling = 0.6
  subnet_number         = "1"

}

module "on_prem_vpc_firewall_allow_iap_all" {
  source = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-ingress-iap"

  project_id        = google_project.on_premise.id
  network_self_link = google_compute_network.on_prem_vpc.self_link
  network_name      = google_compute_network.on_prem_vpc.name

}

module "on_prem_vpc_firewall_allow_rfc1918_all" {
  source = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-ingress-rfc1918"

  project_id        = google_project.on_premise.id
  network_self_link = google_compute_network.on_prem_vpc.self_link
  network_name      = google_compute_network.on_prem_vpc.name

}

/******************************************
  On Prem HA VPN with Transit VPC - Variables
 *****************************************/

variable "vpn_on_prem_transit_east_shared_secret_tunnel_1" {}
variable "vpn_on_prem_transit_east_shared_secret_tunnel_2" {}

variable "vpn_on_prem_transit_central_shared_secret_tunnel_1" {}
variable "vpn_on_prem_transit_central_shared_secret_tunnel_2" {}

variable "nat_instance_tag" {
  default = "allow-default-internet-gateway-access"
}

/******************************************
  On Prem HA VPN with Transit VPC - East
 *****************************************/

module "ha_vpn_on_prem_with_transit_vpc_east" {
  source = "github.com/john-hurringjr/test-modules/networking/vpn-ha-gcp"

  project_1_id              = google_project.on_premise.project_id
  network_1_self_link       = google_compute_network.on_prem_vpc.self_link
  network_1_name            = google_compute_network.on_prem_vpc.name
  network_1_router_bgp_asn  = "4200000500"
  project_2_id              = module.shared_vpc_host_project_transit.project_id
  network_2_self_link       = google_compute_network.transit_vpc.self_link
  network_2_name            = google_compute_network.transit_vpc.name
  network_2_router_bgp_asn  = "4200000100"
  shared_secret_tunnel_1    = var.vpn_on_prem_transit_east_shared_secret_tunnel_1
  shared_secret_tunnel_2    = var.vpn_on_prem_transit_east_shared_secret_tunnel_2
  region                    = "us-east4"

}

module "ha_vpn_on_prem_with_transit_vpc_central" {
  source = "github.com/john-hurringjr/test-modules/networking/vpn-ha-gcp"

  project_1_id              = google_project.on_premise.project_id
  network_1_self_link       = google_compute_network.on_prem_vpc.self_link
  network_1_name            = google_compute_network.on_prem_vpc.name
  network_1_router_bgp_asn  = "4200000501"
  project_2_id              = module.shared_vpc_host_project_transit.project_id
  network_2_self_link       = google_compute_network.transit_vpc.self_link
  network_2_name            = google_compute_network.transit_vpc.name
  network_2_router_bgp_asn  = "4200000101"
  shared_secret_tunnel_1    = var.vpn_on_prem_transit_central_shared_secret_tunnel_1
  shared_secret_tunnel_2    = var.vpn_on_prem_transit_central_shared_secret_tunnel_2
  region                    = "us-central1"

}

/******************************************
  Set Up VM as NAT Gateway
 *****************************************/


module "simple_nat_instance_us_east4" {
  source = "github.com/john-hurringjr/test-modules/gce-instances/simplenat"

  project_id            = google_project.on_premise.project_id
  subnet_self_link      = module.on_prem_vpc_us_east4_subnet.subnet_self_link
  zone                  = "us-east4-b"
  instance_name         = "nat-gateway-instance"
  machine_type          = module.shared_vpc_host_project_transit.project_id
  instance_network_tag  = var.nat_instance_tag

}

resource "google_compute_route" "default_route_to_nat_instance" {

  project               = google_project.on_premise.project_id
  dest_range            = "0.0.0.0/0"
  name                  = "default-route-to-nat-instance"
  network               = google_compute_network.on_prem_vpc.name
  next_hop_instance     = module.simple_nat_instance_us_east4.instance_self_link
  priority              = 1000

}

resource "google_compute_route" "nat_instance_special_route_to_internet_gw" {

  project           = google_project.on_premise.project_id
  dest_range        = "0.0.0.0/0"
  name              = "nat-instance-special-route"
  network           = google_compute_network.on_prem_vpc.name
  next_hop_gateway  = "default-internet-gateway"
  priority          = 100
  tags              = [var.nat_instance_tag, ]

}