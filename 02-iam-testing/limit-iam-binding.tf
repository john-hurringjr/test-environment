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
  Project
 *****************************************/

resource "google_project" "limit_iam_binding_1" {
  name            = "${var.project_unique_shared_id}-limit-iam-binding"
  project_id      = "${var.project_unique_shared_id}-limit-iam-binding"
  folder_id       = google_folder.conditional_access_testing.id
  billing_account = var.billing_account_id
}

resource "google_project" "limit_iam_binding_2" {
  name            = "${var.project_unique_shared_id}-limit-iam-binding"
  project_id      = "${var.project_unique_shared_id}-limit-iam-binding-2"
  folder_id       = google_folder.conditional_access_testing.id
  billing_account = var.billing_account_id
}





/******************************************
  IAM Policy
 *****************************************/

//resource "google_project_iam_policy" "limited_iam_binding_policy" {
//  policy_data = ""
//  project     = google_project.limit_iam_binding_1.project_id
//}

//resource "google_project_iam_binding" "test_limited_iam_admin_permissions" {
//  project = google_project.limit_iam_binding_1.project_id
//  members = [
//    "group:${var.limited_iam_bindings_group}",
//  ]
//  role = "roles/resourcemanager.projectIamAdmin"
//
//  condition {
//    title       = "Test to limit IAM bindings permissions"
//    expression  = "api.getAttribute('iam.googleapis.com/modifiedGrantsByRole', []).hasOnly(['roles/storage.admin', 'roles/billing.user', 'roles/bigquery.admin', 'roles/bigtable.admin'])"
//  }
//}


resource "google_folder_iam_binding" "test_limited_iam_admin_permissions" {
    folder = google_folder.conditional_access_testing.id
    members = [
      "group:${var.limited_iam_bindings_group}",
    ]
    role = "roles/resourcemanager.projectIamAdmin"

    condition {
      title       = "Test to limit IAM bindings permissions"
      expression  = "api.getAttribute('iam.googleapis.com/modifiedGrantsByRole', []).hasOnly(['roles/storage.admin', 'roles/billing.user', 'roles/bigquery.admin', 'roles/bigtable.admin'])"
    }
}




//
//
///******************************************
//  IAM Policy Data
// *****************************************/
//
//data "google_iam_policy" "limited_iam_binding_policy_data" {
//
//  binding {
//    members = [
//      "group:${var.limited_iam_bindings_group}",
//    ]
//    role = "roles/resourcemanager.projectIamAdmin"
//
//    condition {
//      title       = "Test to limit IAM bindings permissions"
//      expression  = "api.getAttribute('iam.googleapis.com/modifiedGrantsByRole', []).hasOnly(['roles/billing.admin', 'roles/billing.user', 'roles/bigquery.admin', 'roles/bigtable.admin'])"
//    }
//
//  }
//
//
//}