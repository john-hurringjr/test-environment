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
#
#/******************************************
#  Shared VPC Host Projects
# *****************************************/
#
#module "shared_vpc_host_project_transit" {
#  source                    = "github.com/john-hurringjr/test-modules//project-creation/archive-old-modules/shared-vpc-host?ref=master"
#  project_friendly_name     = "Shared VPC Host Transit"
#  unique_shared_id          = var.project_unique_shared_id
#  environment               = "trans"
#  folder_id                 = google_folder.networking.id
#  billing_account_id        = var.billing_account_id
#  label_business_unit       = ""
#  label_restrictions        = ""
#  network_admin_group_id    = var.network_admins_group
#  security_admin_group_id   = var.network_admins_group
#
#}
#
#module "shared_vpc_host_project_dev" {
#  source                    = "github.com/john-hurringjr/test-modules//project-creation/archive-old-modules/shared-vpc-host?ref=master"
#  project_friendly_name     = "Shared VPC Host Dev"
#  unique_shared_id          = var.project_unique_shared_id
#  environment               = "dev"
#  folder_id                 = google_folder.networking.id
#  billing_account_id        = var.billing_account_id
#  label_business_unit       = ""
#  label_restrictions        = ""
#  network_admin_group_id    = var.network_admins_group
#  security_admin_group_id   = var.network_admins_group
#
#}
#
#module "shared_vpc_host_project_prod" {
#  source                    = "github.com/john-hurringjr/test-modules//project-creation/archive-old-modules/shared-vpc-host?ref=master"
#  project_friendly_name     = "Shared VPC Host Prod"
#  unique_shared_id          = var.project_unique_shared_id
#  environment               = "prod"
#  folder_id                 = google_folder.networking.id
#  billing_account_id        = var.billing_account_id
#  label_business_unit       = ""
#  label_restrictions        = ""
#  network_admin_group_id    = var.network_admins_group
#  security_admin_group_id   = var.network_admins_group
#
#}
#
#/******************************************
#  Billing Export Project
# *****************************************/
#
#module "billing_export_project" {
#  source                      = "github.com/john-hurringjr/test-modules//project-creation/archive-old-modules/shared-vpc-service-restricted?ref=master"
#  project_friendly_name       = "Billing Export"
#  unique_shared_id            = var.project_unique_shared_id
#  environment                 = "prod"
#  unique_project_identifier   = "billing"
#  folder_id                   = google_folder.shared_services.id
#  billing_account_id          = var.billing_account_id
#  label_business_unit         = ""
#  label_restrictions          = ""
#  project_admin_group_id      = var.billing_admins_group
#  shared_vpc_host_project_id  = module.shared_vpc_host_project_prod.project_id
#}
#
#/******************************************
#  OS Images Projects
# *****************************************/
#
## Dev, used to create approved images
#module "os_images_project_dev" {
#  source                      = "github.com/john-hurringjr/test-modules//project-creation/archive-old-modules/shared-vpc-service-restricted?ref=master"
#  project_friendly_name       = "OS Images - Dev"
#  unique_shared_id            = var.project_unique_shared_id
#  environment                 = "dev"
#  unique_project_identifier   = "osimage"
#  folder_id                   = google_folder.shared_services.id
#  billing_account_id          = var.billing_account_id
#  label_business_unit         = ""
#  label_restrictions          = ""
#  project_admin_group_id      = var.operations_admins_group
#  shared_vpc_host_project_id  = module.shared_vpc_host_project_dev.project_id
#}
#
## Prod, used to share
#module "os_images_project_prod" {
#  source                      = "github.com/john-hurringjr/test-modules//project-creation/archive-old-modules/shared-vpc-service-restricted?ref=master"
#  project_friendly_name       = "OS Images - Prod"
#  unique_shared_id            = var.project_unique_shared_id
#  environment                 = "prod"
#  unique_project_identifier   = "osimage"
#  folder_id                   = google_folder.shared_services.id
#  billing_account_id          = var.billing_account_id
#  label_business_unit         = ""
#  label_restrictions          = ""
#  project_admin_group_id      = var.operations_admins_group
#  shared_vpc_host_project_id  = module.shared_vpc_host_project_prod.project_id
#}
#
#/******************************************
#  Org Log Sink Project
# *****************************************/
#
#module "org_log_sink_project" {
#  source                      = "github.com/john-hurringjr/test-modules//project-creation/archive-old-modules/shared-vpc-service-restricted?ref=master"
#  project_friendly_name       = "Org Log Sink Project"
#  unique_shared_id            = var.project_unique_shared_id
#  environment                 = "prod"
#  unique_project_identifier   = "orgsink"
#  folder_id                   = google_folder.shared_services.id
#  billing_account_id          = var.billing_account_id
#  label_business_unit         = ""
#  label_restrictions          = ""
#  project_admin_group_id      = var.security_admins_group
#  shared_vpc_host_project_id  = module.shared_vpc_host_project_prod.project_id
#}
#
#/******************************************
#  Monitoring Project
# *****************************************/
#
#module "monitoring_project" {
#  source                      = "github.com/john-hurringjr/test-modules//project-creation/archive-old-modules/shared-vpc-service-restricted?ref=master"
#  project_friendly_name       = "Monitoring Project"
#  unique_shared_id            = var.project_unique_shared_id
#  environment                 = "prod"
#  unique_project_identifier   = "monitoring"
#  folder_id                   = google_folder.shared_services.id
#  billing_account_id          = var.billing_account_id
#  label_business_unit         = ""
#  label_restrictions          = ""
#  project_admin_group_id      = var.security_admins_group
#  shared_vpc_host_project_id  = module.shared_vpc_host_project_prod.project_id
#}
#
#/******************************************
#  KMS Project
# *****************************************/
#
#module "kms_project" {
#  source                      = "github.com/john-hurringjr/test-modules//project-creation/archive-old-modules/shared-vpc-service-restricted?ref=master"
#  project_friendly_name       = "KMS Project"
#  unique_shared_id            = var.project_unique_shared_id
#  environment                 = "prod"
#  unique_project_identifier   = "kms"
#  folder_id                   = google_folder.shared_services.id
#  billing_account_id          = var.billing_account_id
#  label_business_unit         = ""
#  label_restrictions          = ""
#  project_admin_group_id      = var.security_admins_group
#  shared_vpc_host_project_id  = module.shared_vpc_host_project_prod.project_id
#}
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#/******************************************
#  Archive - Leaving the VPC SC projects 4 now
# *****************************************/
#
#/******************************************
#  Shared VPC Host Projects
# *****************************************/
#
#module "vpc_sc_shared_vpc_host_project_transit" {
#  source                    = "github.com/john-hurringjr/test-modules//project-creation/archive-old-modules/shared-vpc-host?ref=master"
#  project_friendly_name     = "VPC SC Shared VPC Host Transit"
#  unique_shared_id          = var.vpc_service_controls_unique_id
#  environment               = "trans"
#  folder_id                 = google_folder.vpc_sc_networking.id
#  billing_account_id        = var.billing_account_id
#  label_business_unit       = ""
#  label_restrictions        = ""
#  network_admin_group_id    = var.network_admins_group
#  security_admin_group_id   = var.network_admins_group
#}
#
#module "vpc_sc_shared_vpc_host_project_dev" {
#  source                    = "github.com/john-hurringjr/test-modules//project-creation/archive-old-modules/shared-vpc-host?ref=master"
#  project_friendly_name     = "VPC SC Shared VPC Host Dev"
#  unique_shared_id          = var.vpc_service_controls_unique_id
#  environment               = "dev"
#  folder_id                 = google_folder.vpc_sc_networking.id
#  billing_account_id        = var.billing_account_id
#  label_business_unit       = ""
#  label_restrictions        = ""
#  network_admin_group_id    = var.network_admins_group
#  security_admin_group_id   = var.network_admins_group
#
#}
#
#module "vpc_sc_shared_vpc_host_project_prod" {
#  source                    = "github.com/john-hurringjr/test-modules//project-creation/archive-old-modules/shared-vpc-host?ref=master"
#  project_friendly_name     = "VPC SC Shared VPC Host Prod"
#  unique_shared_id          = var.vpc_service_controls_unique_id
#  environment               = "prod"
#  folder_id                 = google_folder.vpc_sc_networking.id
#  billing_account_id        = var.billing_account_id
#  label_business_unit       = ""
#  label_restrictions        = ""
#  network_admin_group_id    = var.network_admins_group
#  security_admin_group_id   = var.network_admins_group
#}
#
#/******************************************
#  OS Images Projects
# *****************************************/
#
## Dev, used to create approved images
#module "vpc_sc_os_images_project_dev" {
#  source                      = "github.com/john-hurringjr/test-modules//project-creation/archive-old-modules/shared-vpc-service-restricted?ref=master"
#  project_friendly_name       = "VPC SC OS Images - Dev"
#  unique_shared_id            = var.vpc_service_controls_unique_id
#  environment                 = "dev"
#  unique_project_identifier   = "osimage"
#  folder_id                   = google_folder.vpc_sc_shared_services.id
#  billing_account_id          = var.billing_account_id
#  label_business_unit         = ""
#  label_restrictions          = ""
#  project_admin_group_id      = var.operations_admins_group
#  shared_vpc_host_project_id  = module.vpc_sc_shared_vpc_host_project_dev.project_id
#}
#
## Prod, used to share
#module "vpc_sc_os_images_project_prod" {
#  source                      = "github.com/john-hurringjr/test-modules//project-creation/archive-old-modules/shared-vpc-service-restricted?ref=master"
#  project_friendly_name       = "VPC SC OS Images - Prod"
#  unique_shared_id            = var.vpc_service_controls_unique_id
#  environment                 = "prod"
#  unique_project_identifier   = "osimage"
#  folder_id                   = google_folder.vpc_sc_shared_services.id
#  billing_account_id          = var.billing_account_id
#  label_business_unit         = ""
#  label_restrictions          = ""
#  project_admin_group_id      = var.operations_admins_group
#  shared_vpc_host_project_id  = module.vpc_sc_shared_vpc_host_project_prod.project_id
#}
#
#/******************************************
#  Org Log Sink Project
# *****************************************/
#
#module "vpc_sc_org_log_sink_project" {
#  source                      = "github.com/john-hurringjr/test-modules/project-creation/archive-old-modules/shared-vpc-service-restricted"
#  project_friendly_name       = "VPC SC Org Log Sink Project"
#  unique_shared_id            = var.vpc_service_controls_unique_id
#  environment                 = "prod"
#  unique_project_identifier   = "orgsink"
#  folder_id                   = google_folder.vpc_sc_shared_services.id
#  billing_account_id          = var.billing_account_id
#  label_business_unit         = ""
#  label_restrictions          = ""
#  project_admin_group_id      = var.security_admins_group
#  shared_vpc_host_project_id  = module.vpc_sc_shared_vpc_host_project_prod.project_id
#}
#
#/******************************************
#  Monitoring Project
# *****************************************/
#
#module "vpc_sc_monitoring_project" {
#  source                      = "github.com/john-hurringjr/test-modules/project-creation/archive-old-modules/shared-vpc-service-restricted"
#  project_friendly_name       = "VPC SC Monitoring Project"
#  unique_shared_id            = var.vpc_service_controls_unique_id
#  environment                 = "prod"
#  unique_project_identifier   = "monitoring"
#  folder_id                   = google_folder.vpc_sc_shared_services.id
#  billing_account_id          = var.billing_account_id
#  label_business_unit         = ""
#  label_restrictions          = ""
#  project_admin_group_id      = var.security_admins_group
#  shared_vpc_host_project_id  = module.vpc_sc_shared_vpc_host_project_prod.project_id
#}