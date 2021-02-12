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
  Projects
 *****************************************/

module "first_project_limited_testing" {
  source                      = "github.com/john-hurringjr/test-modules/project-creation/testing"
  project_friendly_name       = "Test 1"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "test"
  project_admin_group_id      = var.group_id
  unique_project_identifier   = "limited"
  folder_id                   = var.folder_id
  billing_account_id          = var.billing_account_id
}