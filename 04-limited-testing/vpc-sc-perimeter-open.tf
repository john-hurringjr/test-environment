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
  Access Context Manager Access Level
 *****************************************/

# Allows the TF service account we're using to manage resource in the perimeter
# Without this, we couldn't create VPCs or other resources inside VPC SC Perimter

resource "google_access_context_manager_access_level" "allow_all_ips_us_access_level" {
  parent = "accessPolicies/${var.access_policy_name}"
  name   = "accessPolicies/${var.access_policy_name}/accessLevels/allow_all_ips_us"
  title  = "allow_all_ips_us"
  basic {
    conditions {
      ip_subnetworks = ["0.0.0.0/0"]
      regions = ["US"]
    }
  }
}

# May use the below Access Level for troubleshooting.
# Terraform should clear it out from perimeter each time, but can add temporarily

/******************************************
  Access Context Manager Perimeter (VPC Service Controls)
 *****************************************/

resource "google_access_context_manager_service_perimeter" "service_perimeter" {
  parent = "accessPolicies/${var.access_policy_name}"
  name   = "accessPolicies/${var.access_policy_name}/servicePerimeters/limited_testing"
  title  = "restrict_all"
  status {
    restricted_services = [
      "accessapproval.googleapis.com",
      "notebooks.googleapis.com",
      "ml.googleapis.com",
      "meshca.googleapis.com",
      "apigee.googleapis.com",
      "apigeeconnect.googleapis.com",
      "artifactregistry.googleapis.com",
      "automl.googleapis.com",
      "bigquery.googleapis.com",
      "bigquerydatatransfer.googleapis.com",
      "binaryauthorization.googleapis.com",
      "privateca.googleapis.com",
      "cloudasset.googleapis.com",
      "bigtable.googleapis.com",
      "cloudbuild.googleapis.com",
      "composer.googleapis.com",
      "datafusion.googleapis.com",
      "dlp.googleapis.com",
      "cloudfunctions.googleapis.com",
      "healthcare.googleapis.com",
      "cloudkms.googleapis.com",
      "logging.googleapis.com",
      "monitoring.googleapis.com",
      "cloudprofiler.googleapis.com",
      "spanner.googleapis.com",
      "sqladmin.googleapis.com",
      "storage.googleapis.com",
      "tpu.googleapis.com",
      "cloudtrace.googleapis.com",
      "vision.googleapis.com",
      "compute.googleapis.com",
      "containeranalysis.googleapis.com",
      "containerregistry.googleapis.com",
      "datacatalog.googleapis.com",
      "dataflow.googleapis.com",
      "dataproc.googleapis.com",
      "metastore.googleapis.com",
      "gameservices.googleapis.com",
      "container.googleapis.com",
      "gkeconnect.googleapis.com",
      "gkehub.googleapis.com",
      "iaptunnel.googleapis.com",
      "managedidentities.googleapis.com",
      "redis.googleapis.com",
      "language.googleapis.com",
      "oslogin.googleapis.com",
      "pubsub.googleapis.com",
      "pubsublite.googleapis.com",
      "cloudresourcemanager.googleapis.com",
      "secretmanager.googleapis.com",
      "vpcaccess.googleapis.com",
      "servicecontrol.googleapis.com",
      "servicedirectory.googleapis.com",
      "speech.googleapis.com",
      "storagetransfer.googleapis.com",
      "texttospeech.googleapis.com",
      "translate.googleapis.com",
      "videointelligence.googleapis.com",
      "osconfig.googleapis.com"
    ]
    access_levels = [google_access_context_manager_access_level.allow_all_ips_us_access_level.id]
    resources = [
//      "projects/${module.}",
//      "projects/${module.}",
    ]
  }
}