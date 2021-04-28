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
  Tag Testing
 *****************************************/

resource "google_tags_tag_key" "noownerforyou_key" {
  provider      = "google-beta"
  parent        = "folder/${google_folder.conditional_access_testing.id}"
  short_name    = "noownerforyou"
  description   = "don't allow owner role"
}


resource "google_tags_tag_value" "noownerforyou_value" {
  provider      = "google-beta"
  parent = "tagKeys/${google_tags_tag_key.noownerforyou_key.name}"
  short_name = "true"
  description = "You're not allowed to have an owner."
}

resource "google_tags_tag_binding" "noownerforyou_binding" {
  provider      = "google-beta"
  parent = "//cloudresourcemanager.googleapis.com/folders/${google_folder.conditional_access_testing.id}"
  tag_value = "tagValues/${google_tags_tag_value.value.name}"
}


resource "google_tags_tag_value_iam_binding" "noownerforyou_binding" {
  provider      = "google-beta"
  tag_value = google_tags_tag_value.noownerforyou_value.name
  role = "roles/owner"
  members = [

  ]
}
