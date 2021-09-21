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

resource "google_project" "api_key_testing_1" {
  name            = "${var.project_unique_shared_id}-${var.purpose}-${random_string.rando_string}"
  project_id      = "${var.project_unique_shared_id}-${var.purpose}-${random_string.rando_string}"
  folder_id       = var.folder_id
  billing_account = var.billing_id
}

resource "random_string" "rando_string" {
  length  = 5
  number  = true
  special = false
  lower   = true
  upper   = false
}