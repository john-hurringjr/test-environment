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
  Apply to empty IAM project for testing (Project 1)
 *****************************************/

module "test_custom_role" {
  source      = "github.com/john-hurringjr/iam-modules/test/custom-roles/all-permissions-project"
  project_id  = google_project.empty_iam_1.project_id
}