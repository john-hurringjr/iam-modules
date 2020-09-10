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
variable "roles" {
  type = list
  default = [
    "roles/compute.instanceAdmin.v1",
    "roles/storage.admin"
  ]
}

resource "google_project_iam_member" "iam_member" {
  count   = length(var.roles)
  project = ""
  member  = ""
  role    = var.roles[count.index]
}

//variable "role_mapping" {
//  description = "Map"
//  default = {
//    "value1" = "roles/compute.instanceAdmin.v1"
//    "value2" = "roles/storage.admin"
//  }
//}
//
//resource "google_project_iam_member" "iam_member" {
//  for_each = var.roles
//  project = ""
//  member  = ""
//  role    = each.value
//}