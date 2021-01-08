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

resource "google_access_context_manager_access_policy" "acm_access_policy" {
  parent = "organizations/${var.organization_id}"
  title  = "org acm access policy"
}

/*
Be very careful using the aboce block. If your org already has an access policy this will clear it out and make a new one
Clearing out a policy like this will remove any access levels already created.
*/

/******************************************
  Acceess Context Manager Access Level
 *****************************************/

# Allows the TF service account we're using to manage resource in the perimeter
# Without this, we couldn't create VPCs or other resources inside VPC SC Perimter

resource "google_access_context_manager_access_level" "terraform_service_account_access_level" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.acm_access_policy.name}"
  name   = "accessPolicies/${google_access_context_manager_access_policy.acm_access_policy.name}/accessLevels/allow_terraform_sa"
  title  = "allow_terraform_sa"
  basic {
    conditions {
      members = ["serviceAccount:${var.terraform_service_account}"]
    }
  }
}

# May use the below Access Level for troubleshooting.
# Terraform should clear it out from perimeter each time, but can add temporarily

resource "google_access_context_manager_access_level" "troubleshooting_access_level_security_admins" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.acm_access_policy.name}"
  name   = "accessPolicies/${google_access_context_manager_access_policy.acm_access_policy.name}/accessLevels/sec_admin_troubleshoot"
  title  = "sec_admin_troubleshoot"
  basic {
    conditions {
      members = ["user:${var.vpc_sc_troubleshooting_user_id}"]
    }
  }
}

resource "google_access_context_manager_access_level" "test_domain_1" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.acm_access_policy.name}"
  name   = "accessPolicies/${google_access_context_manager_access_policy.acm_access_policy.name}/accessLevels/test_domain_1"
  title  = "test_domain_1"
  basic {
    conditions {
      members = ["domain:${var.domain_identities[0]}"]
    }
  }
}

/******************************************
  Acceess Context Manager Perimeter (VPC Service Controls)
 *****************************************/

resource "google_access_context_manager_service_perimeter" "service_perimeter" {
  parent = "accessPolicies/${google_access_context_manager_access_policy.acm_access_policy.name}"
  name   = "accessPolicies/${google_access_context_manager_access_policy.acm_access_policy.name}/servicePerimeters/restrict_all"
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
    access_levels = [google_access_context_manager_access_level.terraform_service_account_access_level.id]
    resources = [
      "projects/${module.vpc_sc_monitoring_project.project_number}",
      "projects/${module.vpc_sc_os_images_project_dev.project_number}",
      "projects/${module.vpc_sc_os_images_project_prod.project_number}",
      "projects/${module.vpc_sc_org_log_sink_project.project_number}",
      "projects/${module.vpc_sc_shared_vpc_host_project_dev.project_number}",
      "projects/${module.vpc_sc_shared_vpc_host_project_prod.project_number}",
      "projects/${module.vpc_sc_shared_vpc_host_project_transit.project_number}",
    ]
  }
}