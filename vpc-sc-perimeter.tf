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

resource "google_access_context_manager_access_policy" "access_context_manager_access_policy" {
  parent = "organizations/${var.organization_id}"
  title  = "access context manager access policy"
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
  parent = "accessPolicies/${google_access_context_manager_access_policy.access_context_manager_access_policy.name}"
  name   = "accessPolicies/${google_access_context_manager_access_policy.access_context_manager_access_policy.name}/accessLevels/allow_terraform_sa"
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

/*
Services to add later:
profiler.googleapis.com
      "projects/${module.vpc_sc_monitoring_project.project_number}",
      "projects/${module.vpc_sc_os_images_project_dev.project_number}",
      "projects/${module.vpc_sc_os_images_project_prod.project_number}",
      "projects/${module.vpc_sc_org_log_sink_project.project_number}",
*/

resource "google_access_context_manager_service_perimeter" "service_perimeter" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.access_context_manager_access_policy.name}"
  name   = "accessPolicies/${google_access_context_manager_access_policy.access_context_manager_access_policy.name}/servicePerimeters/restrict_all"
  title  = "restrict_all"
  status {
    restricted_services = [
      "storage.googleapis.com", "ml.googleapis.com", "bigquery.googleapis.com",
      "bigtable.googleapis.com", "cloudasset.googleapis.com", "dataflow.googleapis.com", "dataproc.googleapis.com",
      "dlp.googleapis.com", "cloudkms.googleapis.com", "language.googleapis.com", "pubsub.googleapis.com",
      "meshca.googleapis.com", "spanner.googleapis.com", "sqladmin.googleapis.com", "vision.googleapis.com",
      "containerregistry.googleapis.com", "container.googleapis.com", "gkeconnect.googleapis.com",
      "gkehub.googleapis.com", "cloudresourcemanager.googleapis.com", "logging.googleapis.com",
      "cloudtrace.googleapis.com", "tpu.googleapis.com",
      "videointelligence.googleapis.com",
    ]
    access_levels = [google_access_context_manager_access_level.access_level.id ]
    resources = ["projects/${module.vpc_sc_forseti_project.project_number}"]
  }
}