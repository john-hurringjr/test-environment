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
  Folders
 *****************************************/

resource "google_folder" "iam_top_level" {
  display_name  = "IAM Testing"
  parent        = "organizations/${var.organization_id}"
}

resource "google_folder" "no_domain_restricted_sharing" {
  display_name  = "No Domain Restricted Sharing"
  parent        = google_folder.iam_top_level.id
}

resource "google_folder" "empty_iam_projects" {
  display_name  = "Empty IAM Projects"
  parent        = google_folder.iam_top_level.id
}

resource "google_folder" "conditional_access_testing" {
  display_name  = "Conditional Access Testing"
  parent        = google_folder.iam_top_level.id
}

resource "google_folder" "service_agent_testing_projects" {
  display_name  = "Service Agent Projects"
  parent        = google_folder.iam_top_level.id
}