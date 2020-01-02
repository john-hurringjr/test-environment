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

resource "google_access_context_manager_access_policy" "access-policy" {
  parent = "organizations/${var.organization_id}"
  title  = "access policy"
}

/******************************************
  Acceess Context Manager Access Level
 *****************************************/

//resource "google_access_context_manager_access_level" "access-level" {
//  parent = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}"
//  name   = "accessPolicies/${google_access_context_manager_access_policy.access-policy.name}/accessLevels/chromeos_no_lock"
//  title  = "chromeos_no_lock"
//  basic {
//    conditions {
//      device_policy {
//        require_screen_lock = false
//        os_constraints {
//          os_type = "DESKTOP_CHROME_OS"
//        }
//      }
//    }
//  }
//}