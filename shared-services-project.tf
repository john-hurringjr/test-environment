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
  "On Prem"
 *****************************************/

//module "on_prem_project" {
//
//  source = "github.com/john-hurringjr/test-modules/project-creation"
//
//  project_friendly_name     = "On Premise Environment"
//  unique_shared_id          = var.unique_shared_id
//  environment               = "test"
//  unique_project_identifier = "op-4"
//  folder_id                 = google_folder.on_premise.id
//  billing_account_id        = var.billing_account_id
//  label_business_unit       = "bu1"
//  label_restrictions        = "none"
//  project_admin_group_id    = var.operations_admins_group
//
//}
//
//module "iam_testing_2" {
//
//  source = "github.com/john-hurringjr/test-modules/project-creation"
//
//  project_friendly_name     = "IAM Testing"
//  unique_shared_id          = var.unique_shared_id
//  environment               = "test"
//  unique_project_identifier = "iam-2"
//  folder_id                 = google_folder.on_premise.id
//  billing_account_id        = var.billing_account_id
//  label_business_unit       = "bu1"
//  label_restrictions        = "none"
//  project_admin_group_id    = var.operations_admins_group
//
//}