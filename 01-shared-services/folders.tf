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

resource "google_folder" "enterprise" {
  provider = "google-beta"
  display_name  = "Enterprise"
  parent        = "organizations/${var.organization_id}"
}

resource "google_folder" "shared_services" {
  display_name  = "Shared Services"
  parent        = google_folder.enterprise.id
}

resource "google_folder" "business" {
  display_name  = "Business Folder"
  parent        = google_folder.enterprise.id
}

resource "google_folder" "business_no_restrictions" {
  display_name  = "No Restrictions"
  parent        = google_folder.business.id
}

resource "google_folder" "business_trusted_image" {
  display_name  = "Trusted Image"
  parent        = google_folder.business.id
}

resource "google_folder" "business_location_usa" {
  display_name  = "Location USA"
  parent        = google_folder.business.id
}

resource "google_folder" "networking" {
  display_name  = "Networking"
  parent        = google_folder.shared_services.id
}

resource "google_folder" "on_prem" {
  display_name  = "On Prem"
  parent        = google_folder.enterprise.id
}

/******************************************
  VPC SC Folders
 *****************************************/

resource "google_folder" "vpc_service_controls" {
  display_name  = "VPC Service Controls"
  parent        = google_folder.enterprise.id
}

resource "google_folder" "vpc_sc_shared_services" {
  display_name  = "VPC SC Shared Serv"
  parent        = google_folder.vpc_service_controls.id
}

resource "google_folder" "vpc_sc_business" {
  display_name  = "VPC SC Business"
  parent        = google_folder.vpc_service_controls.id
}

resource "google_folder" "vpc_sc_networking" {
  display_name  = "VPC SC Networking"
  parent        = google_folder.vpc_sc_shared_services.id
}

/******************************************
  Terraform Service Account Owner
 *****************************************/

resource "google_folder_iam_member" "terraform_shared_services_owner_shared_services" {
  folder  = google_folder.shared_services.id
  member = "serviceAccount:${var.terraform_service_account}"
  role    = "roles/owner"
}

resource "google_folder_iam_member" "terraform_shared_services_owner_vpc_sc" {
  folder  = google_folder.vpc_service_controls.id
  member = "serviceAccount:${var.terraform_service_account}"
  role    = "roles/owner"
}