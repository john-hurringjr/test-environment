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
  Folder Policies
 *****************************************/

# Restrict to USA Locations Only
resource "google_folder_organization_policy" "prod_bu_1_folder_location_restriction" {
  constraint  = "constraints/gcp.resourceLocations"
  folder      = google_folder.business_location_usa.id

  list_policy {
    allow {
      values = ["in:us-locations"]
    }
  }

}

# Shared Services, Allow NAT
resource "google_folder_organization_policy" "allow_nat_for_shared_services" {
  constraint  = "constraints/compute.restrictCloudNATUsage"
  folder      = google_folder.shared_services.id

  restore_policy {
    default = true
  }

}