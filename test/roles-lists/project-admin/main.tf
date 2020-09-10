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
  Policy Data
 *****************************************/

variable "project_admin" {
  type = list(string)
  default = [
    "roles/apigee.admin",
    "roles/appengine.appAdmin",
    "roles/artifactregistry.admin",
    "roles/automl.admin",
    "roles/bigquery.admin",
    "roles/bigtable.admin",
    "roles/binaryauthorization.policyAdmin",
    "roles/binaryauthorization.attestorsAdmin",
    "roles/privateca.admin",
    "roles/cloudfunctions.admin",
    "roles/cloudiot.admin",
    "roles/cloudkms.admin",
    "roles/lifesciences.admin",
    "roles/memcache.admin",
    "roles/redis.admin",
    "roles/run.admin",
    "roles/cloudscheduler.admin",
    "roles/spanner.admin",
    "roles/cloudsql.admin",
    "roles/cloudtrace.admin",
    "roles/cloudtranslate.admin",
    "roles/composer.admin",
    "roles/compute.admin",
    "roles/gkehub.gatewayAdmin",
    "roles/containeranalysis.admin",
    "roles/datacatalog.admin",
    "roles/dataflow.admin",
    "roles/datalabeling.admin",
    "roles/dataproc.admin",
    "roles/dialogflow.admin",
    "roles/dlp.admin",
    "roles/dns.admin",
    "roles/endpoints.portalAdmin",
    "roles/composer.environmentAndStorageObjectAdmin",
    "roles/errorreporting.admin",
    "roles/gameservices.admin",
    "roles/genomics.admin",
    "roles/gkehub.admin",
    "roles/managedidentities.admin",
    "roles/recommender.iamAdmin",
    "roles/iap.admin",
    "roles/iap.settingsAdmin",
    "roles/identityplatform.admin",
    "roles/container.admin",
    "roles/logging.admin",
    "roles/ml.admin",
    "roles/monitoring.admin",
    "roles/notebooks.admin",
    "roles/recommender.projectCudAdmin",
    "roles/pubsub.admin",
    "roles/servicemanagement.quotaAdmin",
    "roles/automlrecommendations.admin",
    "roles/vpcaccess.admin",
    "roles/iam.serviceAccountAdmin",
    "roles/iam.serviceAccountKeyAdmin",
    "roles/servicedirectory.admin",
    "roles/servicemanagement.admin",
    "roles/servicenetworking.networksAdmin",
    "roles/serviceusage.serviceUsageAdmin",
    "roles/source.admin",
    "roles/storage.admin",
    "roles/storage.hmacKeyAdmin",
    "roles/storagetransfer.admin",
    "roles/tpu.admin",
    "roles/workflows.admin",
    "roles/deploymentmanager.editor",
    "roles/cloudsecurityscanner.editor",
  ]
}

output "project_admin_roles" {
  value = var.project_admin
}
