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

variable "on_premise_project_id" {}

variable "on_premise_folder_id" {}

/******************************************
  On Prem Project
 *****************************************/

resource "google_project" "on_premise" {
  name            = "On Premise"
  project_id      = var.on_premise_project_id
  folder_id       = "folders/${var.on_premise_folder_id}"
  billing_account = var.billing_account_id
}

resource "google_project_iam_binding" "on_prem_owner" {
  members = ["group:${var.security_admins_group}"]
  role    = "roles/owner"
}

/******************************************
  On Prem Network
 *****************************************/
