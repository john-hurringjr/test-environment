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
  Project 1
 *****************************************/

resource "google_project" "identity_platform_testing_1" {
  name            = "${var.project_unique_shared_id}-identity-p-1"
  project_id      = "${var.project_unique_shared_id}-identity-p-1"
  folder_id       = google_folder.testing_iam_1_folder.id
  billing_account = var.billing_account_id
}

/******************************************
  Project 2
 *****************************************/

resource "google_project" "identity_platform_testing_2" {
  name            = "${var.project_unique_shared_id}-identity-p-2"
  project_id      = "${var.project_unique_shared_id}-identity-p-2"
  folder_id       = google_folder.testing_iam_1_folder.id
  billing_account = var.billing_account_id
}

/******************************************
  Project 3
 *****************************************/

resource "google_project" "identity_platform_testing_3" {
  name            = "${var.project_unique_shared_id}-identity-p-3"
  project_id      = "${var.project_unique_shared_id}-identity-p-3"
  folder_id       = google_folder.testing_iam_1_folder.id
  billing_account = var.billing_account_id
}

/******************************************
  Project 4
 *****************************************/

resource "google_project" "identity_platform_testing_4" {
  name            = "${var.project_unique_shared_id}-identity-p-4"
  project_id      = "${var.project_unique_shared_id}-identity-p-4"
  folder_id       = google_folder.testing_iam_1_folder.id
  billing_account = var.billing_account_id
}

/******************************************
  Project 5
 *****************************************/

resource "google_project" "identity_platform_testing_5" {
  name            = "${var.project_unique_shared_id}-identity-p-5"
  project_id      = "${var.project_unique_shared_id}-identity-p-5"
  folder_id       = google_folder.testing_iam_1_folder.id
  billing_account = var.billing_account_id
}

/******************************************
  Project 6
 *****************************************/

resource "google_project" "identity_platform_testing_6" {
  name            = "${var.project_unique_shared_id}-identity-p-6"
  project_id      = "${var.project_unique_shared_id}-identity-p-6"
  folder_id       = google_folder.testing_iam_1_folder.id
  billing_account = var.billing_account_id
}

///******************************************
//  Project 7
// *****************************************/
//
//resource "google_project" "identity_platform_testing_7" {
//  name            = "${var.project_unique_shared_id}-identity-p-7"
//  project_id      = "${var.project_unique_shared_id}-identity-p-7"
//  folder_id       = google_folder.testing_iam_1_folder.id
//  billing_account = var.billing_account_id
//}
//
///******************************************
//  Project 8
// *****************************************/
//
//resource "google_project" "identity_platform_testing_8" {
//  name            = "${var.project_unique_shared_id}-identity-p-8"
//  project_id      = "${var.project_unique_shared_id}-identity-p-8"
//  folder_id       = google_folder.testing_iam_1_folder.id
//  billing_account = var.billing_account_id
//}