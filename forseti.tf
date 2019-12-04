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

variable "gsuite_forseti_admin_email" {}
variable "domain_for_forseti" {}


/******************************************
  Forseti
 *****************************************/

module "forseti_install" {
  source  = "terraform-google-modules/forseti/google"
  version = "~> 5.0.0"

  gsuite_admin_email = var.gsuite_forseti_admin_email
  domain             = var.domain_for_forseti
  project_id         = module.forseti_project.project_id
  org_id             = var.organization_id

  bucket_cai_location = "US"

}