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
  Project 1
 *****************************************/

module "project_limited_testing_1" {
  source                      = "github.com/john-hurringjr/test-modules/project-creation/testing"
  project_friendly_name       = "Test 1"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "test"
  project_admin_group_id      = var.group_id
  unique_project_identifier   = "mm-prj-1"
  folder_id                   = var.folder_id
  billing_account_id          = var.billing_account_id
}

/******************************************
  Project 2
 *****************************************/

module "project_limited_testing_2" {
  source                      = "github.com/john-hurringjr/test-modules/project-creation/testing"
  project_friendly_name       = "Test 2"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "test"
  project_admin_group_id      = var.group_id
  unique_project_identifier   = "sm-prj-1"
  folder_id                   = var.folder_id
  billing_account_id          = var.billing_account_id
}

/******************************************
  Project 3
 *****************************************/

module "project_limited_testing_3" {
  source                      = "github.com/john-hurringjr/test-modules/project-creation/testing"
  project_friendly_name       = "Test 3"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "test"
  project_admin_group_id      = var.group_id
  unique_project_identifier   = "vj-prj-1"
  folder_id                   = var.folder_id
  billing_account_id          = var.billing_account_id
}

/******************************************
  Project 4
 *****************************************/

module "project_limited_testing_4" {
  source                      = "github.com/john-hurringjr/test-modules/project-creation/testing"
  project_friendly_name       = "Test 4"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "test"
  project_admin_group_id      = var.group_id
  unique_project_identifier   = "nm-prj-1"
  folder_id                   = var.folder_id
  billing_account_id          = var.billing_account_id
}

/******************************************
  Project 5
 *****************************************/

module "project_limited_testing_5" {
  source                      = "github.com/john-hurringjr/test-modules/project-creation/testing"
  project_friendly_name       = "Test 5"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "test"
  project_admin_group_id      = var.group_id
  unique_project_identifier   = "zd-prj-1"
  folder_id                   = var.folder_id
  billing_account_id          = var.billing_account_id
}

/******************************************
  Project 6
 *****************************************/

module "project_limited_testing_6" {
  source                      = "github.com/john-hurringjr/test-modules/project-creation/testing"
  project_friendly_name       = "Test 6"
  unique_shared_id            = var.project_unique_shared_id
  environment                 = "test"
  project_admin_group_id      = var.group_id
  unique_project_identifier   = "jh-prj-1"
  folder_id                   = var.folder_id
  billing_account_id          = var.billing_account_id
}