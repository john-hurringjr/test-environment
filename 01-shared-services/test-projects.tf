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
  Test Service Project
 *****************************************/

module "us_only_test_prj_1" {
  source                      = "github.com/john-hurringjr/test-modules/project-creation/archive-old-modules/shared-vpc-service?ref=master"
  project_friendly_name       = "Test - US Only - GKE"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "dev"
  unique_project_identifier   = "us-gke-test-1"
  folder_id                   = google_folder.vpc_sc_networking.id
  project_admin_group_id      = var.test_us_only_service_prj_group
  shared_vpc_host_project_id = module.shared_vpc_host_project_dev.project_id
}