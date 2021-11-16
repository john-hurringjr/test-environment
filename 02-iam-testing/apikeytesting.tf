#/**
# *
# * Licensed under the Apache License, Version 2.0 (the "License");
# * you may not use this file except in compliance with the License.
# * You may obtain a copy of the License at
# *
# *      http://www.apache.org/licenses/LICENSE-2.0
# *
# * Unless required by applicable law or agreed to in writing, software
# * distributed under the License is distributed on an "AS IS" BASIS,
# * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# * See the License for the specific language governing permissions and
# * limitations under the License.
# */
#/******************************************
#  Project 1
# *****************************************/
#
#module "testing_api_key_1" {
#  source = "../local-mods/simple-project"
#  billing_id = var.billing_account_id
#  project_unique_shared_id = var.project_unique_shared_id
#  folder_id = google_folder.testing_iam_api_keys.id
#  purpose = "apikey"
#}
#
#/******************************************
#  Project 2
# *****************************************/
#
#module "testing_api_key_2" {
#  source = "../local-mods/simple-project"
#  billing_id = var.billing_account_id
#  project_unique_shared_id = var.project_unique_shared_id
#  folder_id = google_folder.testing_iam_api_keys.id
#  purpose = "apikey"
#}
#
#/******************************************
#  Project 3
# *****************************************/
#
#module "testing_api_key_3" {
#  source = "../local-mods/simple-project"
#  billing_id = var.billing_account_id
#  project_unique_shared_id = var.project_unique_shared_id
#  folder_id = google_folder.testing_iam_api_keys.id
#  purpose = "apikey"
#}