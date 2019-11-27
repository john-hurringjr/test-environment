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
  Org IAM
 *****************************************/

//module "org_iam" {
//  source = "github.com/john-hurringjr/test-modules/org-iam"
//
//  organization_admins_group = var.organization_admins_group
//  terraform_service_account = var.terraform_service_account
//  network_admins_group      = var.network_admins_group
//  security_admins_group     = var.security_admins_group
//  sre_group                 = var.sre_group
//  domain_identity_primary   = var.domain_identity_primary
//  domain_identity_secondary = var.domain_identity_secondary
//  organization_id           = var.organization_id
//
//}

/******************************************
  Org Policies
 *****************************************/

//module "org_policies" {
//  source = "github.com/john-hurringjr/test-modules/org-iam"
//
//  domain_identity_primary   = var.domain_identity_primary
//  domain_identity_secondary = var.domain_identity_secondary
//  organization_id           = var.organization_id
//
//}