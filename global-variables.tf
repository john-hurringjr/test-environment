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
  Variables to be used in multiple TF files
 *****************************************/

variable "organization_id" {
  type = string
}

variable "organization_admins_group" {
  type = string
}

variable "terraform_service_account" {
  type = string
}

variable "network_admins_group" {
  type = string
}

variable "security_admins_group" {
  type = string
}

variable "sre_group" {
  type = string
}

variable "billing_admins_group" {
  type = string
}

variable "domain_identity_primary" {
  type = string
}

variable "domain_identity_secondary" {
  type = string
}

/******************************************
  Variables for project creation
 *****************************************/

variable "unique_shared_id" {
  type = string
}

variable "billing_account_id" {}

