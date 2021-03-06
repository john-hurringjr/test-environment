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
  Test Code for TF VM
 *****************************************/

//resource "google_access_context_manager_service_perimeter" "test_terraform_vm_perimeter" {
//  parent = "accessPolicies/${var.access_policy_name}"
//  name   = "accessPolicies/${var.access_policy_name}/servicePerimeters/tf_vm_perimeter"
//  title  = "tf_vm_perimeter"
//  status {
//    restricted_services = [
//      "accessapproval.googleapis.com",
//      "notebooks.googleapis.com",
//      "ml.googleapis.com",
//      "meshca.googleapis.com",
//      "apigee.googleapis.com",
//      "apigeeconnect.googleapis.com",
//      "artifactregistry.googleapis.com",
//      "automl.googleapis.com",
//      "bigquery.googleapis.com",
//      "bigquerydatatransfer.googleapis.com",
//      "binaryauthorization.googleapis.com",
//      "privateca.googleapis.com",
//      "cloudasset.googleapis.com",
//      "bigtable.googleapis.com",
//      "cloudbuild.googleapis.com",
//      "composer.googleapis.com",
//      "datafusion.googleapis.com",
//      "dlp.googleapis.com",
//      "cloudfunctions.googleapis.com",
//      "healthcare.googleapis.com",
//      "cloudkms.googleapis.com",
//      "logging.googleapis.com",
//      "monitoring.googleapis.com",
//      "cloudprofiler.googleapis.com",
//      "spanner.googleapis.com",
//      "sqladmin.googleapis.com",
//      "storage.googleapis.com",
//      "tpu.googleapis.com",
//      "cloudtrace.googleapis.com",
//      "vision.googleapis.com",
//      "compute.googleapis.com",
//      "containeranalysis.googleapis.com",
//      "containerregistry.googleapis.com",
//      "datacatalog.googleapis.com",
//      "dataflow.googleapis.com",
//      "dataproc.googleapis.com",
//      "metastore.googleapis.com",
//      "gameservices.googleapis.com",
//      "container.googleapis.com",
//      "gkeconnect.googleapis.com",
//      "gkehub.googleapis.com",
//      "iaptunnel.googleapis.com",
//      "managedidentities.googleapis.com",
//      "redis.googleapis.com",
//      "language.googleapis.com",
//      "oslogin.googleapis.com",
//      "pubsub.googleapis.com",
//      "pubsublite.googleapis.com",
//      "cloudresourcemanager.googleapis.com",
//      "secretmanager.googleapis.com",
//      "vpcaccess.googleapis.com",
//      "servicecontrol.googleapis.com",
//      "servicedirectory.googleapis.com",
//      "speech.googleapis.com",
//      "storagetransfer.googleapis.com",
//      "texttospeech.googleapis.com",
//      "translate.googleapis.com",
//      "videointelligence.googleapis.com",
//      "osconfig.googleapis.com"
//    ]
//
//    vpc_accessible_services {
//      enable_restriction = true
//      allowed_services = ["RESTRICTED-SERVICES"]
//    }
//
//  }
//
//  # The below is required so we can dynamically add new projects to perimeter
//  # Without this block, if we create new projects and add them, this resource
//  # will wipe out those additions and revert to whatever we list here
//  lifecycle {
//    ignore_changes = [status[0].resources]
//  }
//
//}
//
//
///******************************************
//  Test Code for TF VM
// *****************************************/
//
//resource "google_storage_bucket" "tf_vm_test_bucket" {
//  project = ""
//  name    = ""
//}
