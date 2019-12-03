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

module "shared_vpc_host_project_transit" {

  source = "github.com/john-hurringjr/test-modules/project-creation-hostprj"

  project_friendly_name     = "Shared VPC Host Transit"
  unique_shared_id          = var.unique_shared_id
  environment               = "transit"
  folder_id                 = google_folder.networking.id
  billing_account_id        = var.billing_account_id
  label_business_unit       = ""
  label_restrictions        = ""
  network_admin_group_id    = var.network_admins_group
  security_admin_group_id   = var.network_admins_group

}

module "shared_vpc_host_project_dev" {

  source = "github.com/john-hurringjr/test-modules/project-creation-hostprj"

  project_friendly_name     = "Shared VPC Host Dev"
  unique_shared_id          = var.unique_shared_id
  environment               = "dev"
  folder_id                 = google_folder.networking.id
  billing_account_id        = var.billing_account_id
  label_business_unit       = ""
  label_restrictions        = ""
  network_admin_group_id    = var.network_admins_group
  security_admin_group_id   = var.network_admins_group

}

module "shared_vpc_host_project_prod" {

  source = "github.com/john-hurringjr/test-modules/project-creation-hostprj"

  project_friendly_name     = "Shared VPC Host Prod"
  unique_shared_id          = var.unique_shared_id
  environment               = "prod"
  folder_id                 = google_folder.networking.id
  billing_account_id        = var.billing_account_id
  label_business_unit       = ""
  label_restrictions        = ""
  network_admin_group_id    = var.network_admins_group
  security_admin_group_id   = var.network_admins_group

}

/******************************************
  Testing
 *****************************************/

//module "service_project_testing_1" {
//
//  source = "github.com/john-hurringjr/test-modules/project-creation-serviceprj"
//
//  project_friendly_name       = "Service Project Testing"
//  unique_shared_id            = var.unique_shared_id
//  environment                 = "test"
//  unique_project_identifier   = "serv-1"
//  folder_id                   = google_folder.internal.id
//  billing_account_id          = var.billing_account_id
//  label_business_unit         = "bu1"
//  label_restrictions          = "none"
//  project_admin_group_id      = var.application_1_admins_group
//  shared_vpc_host_project_id  = module.host_project_testing_1.project_id
//
//}


/******************************************
  "On Prem"
 *****************************************/