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
  Folder IAM
 *****************************************/


data "google_iam_policy" "org_perm_folder_policy_data" {

//  binding {
//    members = [
//      "serviceAccount:${var.terraform_service_account}",
//    ]
//    role = "roles/orgpolicy.policyAdmin"
//  }

  binding {
    members = [
      "serviceAccount:${var.terraform_service_account}",
    ]
    role = "roles/orgpolicy.policyViewer"
  }

  binding {
    members = [
      "serviceAccount:${var.terraform_service_account}",
    ]
    role = "roles/resourcemanager.organizationAdmin"
  }

//  binding {
//    members = [
//      "serviceAccount:${var.terraform_service_account}",
//    ]
//    role = "roles/resourcemanager.organizationViewer"
//  }

  binding {
    members = [
      "serviceAccount:${var.terraform_service_account}",
    ]
    role = "roles/securitycenter.admin"
  }

//  binding {
//    members = [
//      "serviceAccount:${var.terraform_service_account}",
//    ]
//    role = "roles/securitycenter.assetsViewer"
//  }

//  binding {
//    members = [
//      "serviceAccount:${var.terraform_service_account}",
//    ]
//    role = "roles/securitycenter.sourcesViewer"
//  }

//  binding {
//    members = [
//      "serviceAccount:${var.terraform_service_account}",
//    ]
//    role = "roles/cloudsupport.viewer"
//  }

  binding {
    members = [
      "serviceAccount:${var.terraform_service_account}",
    ]
    role = "roles/threatdetection.viewer"
  }

//  binding {
//    members = [
//      "serviceAccount:${var.terraform_service_account}",
//    ]
//    role = "roles/billing.creator"
//  }

//  binding {
//    members = [
//      "serviceAccount:${var.terraform_service_account}",
//    ]
//    role = "roles/compute.osLoginExternalUser"
//  }

//  binding {
//    members = [
//      "serviceAccount:${var.terraform_service_account}",
//    ]
//    role = "roles/iam.organizationRoleAdmin"
//  }

}

/******************************************
  Apply Shared Services IAM Policy
 *****************************************/

resource "google_folder_iam_policy" "org_perm_folder_iam" {
  folder      = google_folder.org_perm_folder_testing.id
  policy_data = data.google_iam_policy.org_perm_folder_policy_data.policy_data
}