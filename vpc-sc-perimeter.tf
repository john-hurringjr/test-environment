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
  Acceess Context Manager Access Policy
 *****************************************/

resource "google_access_context_manager_access_policy" "access_policy" {
  parent = "organizations/${var.organization_id}"
  title  = "access policy2"
}

/*
If above fails (Most likely because you already created a policy) you have two options:
1) Import the Terraform Resource
2) Add variables with Access Policy Name/Info and use those for future resources
*/

/******************************************
  Acceess Context Manager Access Level
 *****************************************/

# Allows the TF service account we're using to manage resource in the perimeter
# Without this, we couldn't create VPCs or other resources inside VPC SC Perimter

resource "google_access_context_manager_access_level" "access_level" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access_policy.name}"
  name   = "accessPolicies/${google_access_context_manager_access_policy.access_policy.name}/accessLevels/allow_terraform_sa"
  title  = "allow_terraform_sa"
  basic {
    conditions {
      members = ["serviceAccount:${var.terraform_service_account}"]
    }
  }
}

/******************************************
  Acceess Context Manager Perimeter (VPC Service Controls)
 *****************************************/

resource "google_access_context_manager_service_perimeter" "service_perimeter" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access_policy.name}"
  name   = "accessPolicies/${google_access_context_manager_access_policy.access_policy.name}/servicePerimeters/restrict_all"
  title  = "restrict_all"
  status {
    restricted_services = ["storage.googleapis.com"]
    access_levels = ["accessPolicies/${google_access_context_manager_access_policy.access_policy.id}/accessLevels/${google_access_context_manager_access_level.access_level.name}"]
    resources = ["projects/${module.vpc_sc_forseti_project.project_number}"]
  }
}