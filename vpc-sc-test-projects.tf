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

module "vpc_sc_test_project_dev_1" {
  source                      = "github.com/john-hurringjr/test-modules/project-creation/shared-vpc-service-restricted"
  project_friendly_name       = "Test VPC SC Dev"
  unique_shared_id            = var.vpc_service_controls_unique_id
  environment                 = "dev"
  unique_project_identifier   = "test1"
  folder_id                   = google_folder.vpc_sc_business.id
  billing_account_id          = var.billing_account_id
  label_business_unit         = ""
  label_restrictions          = ""
  project_admin_group_id      = var.application_1_admins_group
  shared_vpc_host_project_id  = module.vpc_sc_shared_vpc_host_project_dev.project_id
}
