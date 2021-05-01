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
  Create Folders
 *****************************************/
resource "google_folder" "ingress_egress" {
  display_name  = "Ingress Egress"
  parent        = "organizations/${var.organization_id}"
}

/******************************************
  Folder IAM
 *****************************************/

resource "google_folder_iam_member" "tf_owner_sa" {
  folder = google_folder.ingress_egress.id
  member = "serviceAccount:${var.terraform_service_account}"
  role = "roles/owner"
}

resource "google_folder_iam_member" "tf_owner_me" {
  folder = google_folder.ingress_egress.id
  member = "user:${var.my_id}"
  role = "roles/owner"
}

