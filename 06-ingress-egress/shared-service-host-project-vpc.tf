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
  Shared VPC Host
 *****************************************/

module "shared_vpc_host_project" {
  source                    = "github.com/john-hurringjr/test-modules/project-creation/vpc-sc-restricted-access-2/shared-vpc-host"
  project_friendly_name     = "Shared VPC Host"
  unique_shared_id          = var.project_unique_shared_id
  environment               = "srvs"
  folder_id                 = google_folder.ingress_egress.id
  billing_account_id        = var.billing_account_id
  label_business_unit       = "shared-services"
  label_restrictions        = "none"
  network_viewer_group_id   = var.network_admins_group
  service_perimeter_name    = google_access_context_manager_service_perimeter.service_perimeter_configuration_shared_srvs.name
}
