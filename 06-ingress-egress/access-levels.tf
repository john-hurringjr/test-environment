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
  Access Levels
 *****************************************/

# Allow TF account to set up test config and my ID
//resource "google_access_context_manager_access_level" "allow_tf_and_me" {
//  parent = "accessPolicies/${var.access_policy_name}"
//  name   = "accessPolicies/${var.access_policy_name}/accessLevels/allow_tf_and_me"
//  title  = "allow_tf_and_me"
//  basic {
//    conditions {
//      members = [
//        "user:${var.my_id}", "serviceAccount:${var.terraform_service_account}"
//      ]
//    }
//  }
//}