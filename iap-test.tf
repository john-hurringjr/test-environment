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

/*
  Testing the ability to use IAP to "jump" from private
  connected vm to isolated vpc with iap and vpc sc enabled
*/

/******************************************
  Isolated VPC inside Test prject (i.e. not shared host)
 *****************************************/

resource "google_compute_network" "isolated_vpc_iap_testing" {
  project                         = module.test_project_dev_1.project_id
  name                            = "isolated-vpc"
  routing_mode                    = "GLOBAL"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}

module "isolated_vpc_iap_testing_region_1_subnet" {
  source                = "github.com/john-hurringjr/test-modules/networking/subnet/generic"
  project_id            = module.test_project_dev_1.project_id
  network_self_link     = google_compute_network.isolated_vpc_iap_testing.self_link
  network_name          = google_compute_network.isolated_vpc_iap_testing.name
  region                = var.region_1
  cidr                  = var.development_vpc_region_1_cidr
  vpc_flow_log_interval = var.shared_vpc_flow_log_interval
  vpc_flow_log_sampling = var.shared_vpc_flow_log_sampling
  subnet_number         = "1"
}

module "isolated_vpc_iap_testing_region_2_subnet" {
  source                = "github.com/john-hurringjr/test-modules/networking/subnet/generic"
  project_id            = module.test_project_dev_1.project_id
  network_self_link     = google_compute_network.isolated_vpc_iap_testing.self_link
  network_name          = google_compute_network.isolated_vpc_iap_testing.name
  region                = var.region_2
  cidr                  = var.development_vpc_region_2_cidr
  vpc_flow_log_interval = var.shared_vpc_flow_log_interval
  vpc_flow_log_sampling = var.shared_vpc_flow_log_sampling
  subnet_number         = "1"
}

module "isolated_vpc_firewall_allow_iap_all" {
  source            = "github.com/john-hurringjr/test-modules/networking/firewall-rules/all/allow-ingress-iap"
  project_id        = module.test_project_dev_1.project_id
  network_self_link = google_compute_network.isolated_vpc_iap_testing.self_link
  network_name      = google_compute_network.isolated_vpc_iap_testing.name
}