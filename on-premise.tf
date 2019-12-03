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
  members = ["group:${var.security_admins_group}"]
  role    = "roles/owner"
}


/******************************************
  Org Policy Exception for External IP
 *****************************************/

resource "google_project_organization_policy" "on_prem_external_ip_exception" {
  constraint  = "compute.vmExternalIpAccess"
  project     = google_project.on_premise.id

  list_policy {
    inherit_from_parent = false
    allow {
      all = true
    }

}

/******************************************
  On Prem Network
 *****************************************/

resource "google_compute_network" "on_prem_vpc" {
  project       = module.shared_vpc_host_project_transit.project_id
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
  source = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-ingress-rfc-1918"

  project_id        = google_project.on_premise.id
  network_self_link = google_compute_network.on_prem_vpc.self_link
  network_name      = google_compute_network.on_prem_vpc.name

}

/******************************************
  On Prem HA VPN with Transit VPC
 *****************************************/