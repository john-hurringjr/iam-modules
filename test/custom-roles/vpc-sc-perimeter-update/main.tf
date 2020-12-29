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

resource "google_organization_iam_custom_role" "vpc_sc_update_custom_role" {
  permissions = [
    "accesscontextmanager.servicePerimeters.get",
    "accesscontextmanager.servicePerimeters.list",
    "accesscontextmanager.servicePerimeters.update",
    "resourcemanager.organizations.get",
    "resourcemanager.projects.get",
    "resourcemanager.projects.list"
  ]
  org_id      = var.org_id
  role_id     = var.custom_role_id
  title       = var.custom_role_friendly_name
}