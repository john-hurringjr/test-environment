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

//resource "google_project" "empty_iam_1" {
//  name            = "${var.project_unique_shared_id}-empty-iam-1"
//  project_id      = "${var.project_unique_shared_id}-empty-iam-1"
//  folder_id       = google_folder.empty_iam_projects.id
//  billing_account = var.billing_account_id
//}
//
//module "empty_iam_1_policy" {
//  source      = "github.com/john-hurringjr/iam-modules/test/empty/project"
//  project_id  = google_project.empty_iam_1.project_id
//}
//
///******************************************
//  Project 2
// *****************************************/
//
//resource "google_project" "empty_iam_2" {
//  name            = "${var.project_unique_shared_id}-empty-iam-2"
//  project_id      = "${var.project_unique_shared_id}-empty-iam-2"
//  folder_id       = google_folder.empty_iam_projects.id
//  billing_account = var.billing_account_id
//}
//
//module "empty_iam_2_policy" {
//  source      = "github.com/john-hurringjr/iam-modules/test/empty/project"
//  project_id  = google_project.empty_iam_2.project_id
//}