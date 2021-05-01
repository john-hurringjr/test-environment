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
  Access Context Manager Perimeter (VPC Service Controls)
 *****************************************/
resource "google_access_context_manager_service_perimeter" "service_perimeter_configuration_shared_srvs" {
  parent = "accessPolicies/${var.access_policy_name}"
  name   = "accessPolicies/${var.access_policy_name}/servicePerimeters/shared_srvs"
  title  = "shared_srvs"
  status {
    vpc_accessible_services {
      enable_restriction = true
      allowed_services = ["RESTRICTED-SERVICES"]
    }

    access_levels = [
      google_access_context_manager_access_level.allow_tf_and_me.id,
    ]

  }

  # The below is required so we can dynamically add new projects to perimeter
  # Without this block, if we create new projects and add them, this resource
  # will wipe out those additions and revert to whatever we list here
  lifecycle {
    ignore_changes = [status[0].resources]
  }

}