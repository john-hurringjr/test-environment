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
  Project - DataFlow 1
 *****************************************/

resource "google_project" "dataflow_1" {
  name            = "${var.project_unique_shared_id}-dataflow-1"
  project_id      = "${var.project_unique_shared_id}-dataflow-1"
  folder_id       = google_folder.service_agent_testing_projects.id
  billing_account = var.billing_account_id
}

resource "google_project_service" "dataflow_enable_api_1" {
  depends_on          = [google_project.dataflow_1]
  project             = google_project.dataflow_1.project_id
  service             = "dataflow.googleapis.com"
  disable_on_destroy  = false
}

/******************************************
  Project - Functions 1
 *****************************************/

resource "google_project" "functions_1" {
  name            = "${var.project_unique_shared_id}-functions-1"
  project_id      = "${var.project_unique_shared_id}-functions-1"
  folder_id       = google_folder.service_agent_testing_projects.id
  billing_account = var.billing_account_id
}

resource "google_project_service" "cloudfunctions_enale_api_1" {
  depends_on          = [google_project.functions_1]
  project             = google_project.functions_1.project_id
  service             = "cloudfunctions.googleapis.com"
  disable_on_destroy  = false
}

/******************************************
  Project - Composer 1
 *****************************************/

resource "google_project" "composer_1" {
  name            = "${var.project_unique_shared_id}-composer-1"
  project_id      = "${var.project_unique_shared_id}-composer-1"
  folder_id       = google_folder.service_agent_testing_projects.id
  billing_account = var.billing_account_id
}

resource "google_project_service" "composer_enale_api_1" {
  depends_on          = [google_project.composer_1]
  project             = google_project.composer_1.project_id
  service             = "composer.googleapis.com"
  disable_on_destroy  = false
}