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
  Folder Creation
 *****************************************/

resource "google_folder" "test_folder" {
  display_name  = "Test"
  parent        = "organizations/${var.organization_id}"
}

/******************************************
  Folder IAM
 *****************************************/

module "test_folder_iam_module" {
  source                                      = "github.com/john-hurringjr/test-modules/folder-iam/vpc-sc-two-service-accounts"
  terraform_project_creator_service_account   = var.terraform_service_account
  terraform_resource_creator_service_account  = var.terraform_service_account
  folder_id                                   = google_folder.test_folder.id
}

resource "google_folder_organization_policy" "test_folder_location_restriction" {
  constraint  = "constraints/gcp.resourceLocations"
  folder      = google_folder.test_folder.id

  list_policy {
    allow {
      values = ["us-locations"]
    }
  }

}