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
    "roles/assuredworkloads.admin",
    "roles/automl.admin",
    "roles/bigquery.admin",
    "roles/bigtable.admin",
    "roles/binaryauthorization.policyAdmin",
    "roles/binaryauthorization.attestorsAdmin",
    "roles/privateca.admin",
    "roles/cloudfunctions.admin",
  ]
}

output "project_admin_roles" {
  value = var.project_admin
}
