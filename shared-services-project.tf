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
  Shared VPC Host Projects
 *****************************************/

module "host_project_testing_1" {

  source = "github.com/john-hurringjr/test-modules/project-creation-hostprj"

  project_friendly_name     = "Shared VPC Host Testing"
  unique_shared_id          = var.unique_shared_id
  environment               = "test"
  unique_project_identifier = "host-1"
  folder_id                 = google_folder.shared_services.id
  billing_account_id        = var.billing_account_id
  label_business_unit       = "bu1"
  label_restrictions        = "none"
  network_admin_group_id    = var.network_admins_group
  security_admin_group_id   = var.network_admins_group

}


/******************************************
  Testing
 *****************************************/

//module "iam_testing_4" {
//
//  source = "github.com/john-hurringjr/test-modules/project-creation-serviceprj"
//
//  project_friendly_name       = "IAM Testing"
//  unique_shared_id            = var.unique_shared_id
//  environment                 = "test"
//  unique_project_identifier   = "iam-3"
//  folder_id                   = google_folder.on_premise.id
//  billing_account_id          = var.billing_account_id
//  label_business_unit         = "bu1"
//  label_restrictions          = "none"
//  project_admin_group_id      = var.operations_admins_group
//  shared_vpc_host_project_id  = module.host_project_testing_1.outputs.project_id
//
//}


/******************************************
  "On Prem"
 *****************************************/