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
  Role
 *****************************************/

resource "google_organization_iam_custom_role" "custom_billing_role" {
  role_id     = "mycustombillingrole1"
  org_id      = var.organization_id
  title       = "Custom Billing Role"
  description = "A description"
  permissions = [
    "billing.accounts.get",
    "billing.accounts.getIamPolicy",
    "billing.accounts.list",
    "billing.accounts.setIamPolicy",
    "billing.accounts.update",
  ]
}


/******************************************
  Test Apply to Billing Account
 *****************************************/

resource "google_billing_account_iam_member" "test_apply_custom_to_billing" {
  billing_account_id = var.billing_account_id
  member              = "group:${var.limited_iam_bindings_group}"
  role                = google_organization_iam_custom_role.custom_billing_role.id
}