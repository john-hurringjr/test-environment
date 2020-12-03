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
//
///******************************************
//  Folder IAM
// *****************************************/
//
//data "google_iam_policy" "scc_folder_policy_data" {
//
//  binding {
//    members = [
//      "user:${var.terraform_service_account}",
//    ]
//    role = "securitycenter.assetSecurityMarksWriter"
//  }
//
//}
//
///******************************************
//  Apply Shared Services IAM Policy
// *****************************************/
//
//resource "google_folder_iam_policy" "scc_folder_iam" {
//  folder      = google_folder.org_perm_folder_testing.id
//  policy_data = data.google_iam_policy.org_perm_folder_policy_data.policy_data
//}