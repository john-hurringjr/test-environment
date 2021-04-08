
data "google_iam_policy" "testing_iam_blank_folder_policy_data" {

}

/******************************************
  Apply Shared Services IAM Policy
 *****************************************/

resource "google_folder_iam_policy" "org_perm_folder_iam" {
  folder      = google_folder.testing_iam_blank_folder.id
  policy_data = data.google_iam_policy.testing_iam_blank_folder_policy_data.policy_data
}