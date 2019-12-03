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
  Shared VPC Host - Transit
 *****************************************/

resource "google_compute_network" "transit_vpc" {
  project       = module.shared_vpc_host_project_transit.project_id
  name          = "transit-vpc"
  routing_mode  = "GLOBAL"

  auto_create_subnetworks = false

}

module "transit_vpc_us_east4_subnet_1" {

  source = "github.com/john-hurringjr/test-modules/project-creation-hostprj"

  project_id        = module.shared_vpc_host_project_transit.project_id
  network_self_link = google_compute_network.transit_vpc.self_link
  network_name      = google_compute_network.transit_vpc.name

  region  = "us-east4"
  cidr    = "192.168.0.0/28"

  vpc_flow_log_interval = "INTERVAL_10_MIN"
  vpc_flow_log_sampling = 0.6
  subnet_number         = "1"

}

module "transit_vpc_us_central1_subnet_1" {

  source = "github.com/john-hurringjr/test-modules/project-creation-hostprj"

  project_id        = module.shared_vpc_host_project_transit.project_id
  network_self_link = google_compute_network.transit_vpc.self_link
  network_name      = google_compute_network.transit_vpc.name

  region  = "us-central1"
  cidr    = "192.168.192.0/28"

  vpc_flow_log_interval = "INTERVAL_10_MIN"
  vpc_flow_log_sampling = 0.6
  subnet_number         = "1"

}