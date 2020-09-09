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
  Variables
 *****************************************/
variable "project_id" {
  type        = string
  description = "Project ID this custom role will be created on"
}

variable "custom_role_friendly_name" {
  type        = string
  description = "Name of the custom role. Default custom-project-owner."
  default     = "custom-project-owner"
}

variable "custom_role_id" {
  type        = string
  description = "ID of the custom role. Default custom_project_owner."
  default     = "custom_project_owner"
}

variable "permissions" {
  type = list(string)
  description = "List of permissions desired for role. Default includes many project permissions (close to owner)"
  default = ["cloudsql.sslCerts.*", "iam.roles.create"]

}



/*

    "accessapproval.requests.*",
    "accessapproval.settings.*",
    "accesscontextmanager.accessLevels.*",
    "accesscontextmanager.accessPolicies.*",
    "accesscontextmanager.accessZones.*",
    "accesscontextmanager.policies.*",
    "accesscontextmanager.servicePerimeters.*",
    "actions.agent.*",
    "actions.agentVersions.*",
    "androidmanagement.enterprises.*",
    "apigateway.apiconfigs.*",
    "apigateway.apis.*",
    "apigateway.gateways.*",
    "apigateway.locations.*",
    "apigateway.operations.*",
    "apigee.apiproductattributes.*",
    "apigee.apiproducts.*",
    "apigee.appkeys.*",
    "apigee.apps.*",
    "apigee.caches.*",
    "apigee.canaryevaluations.*"
    "apigee.datacollectors.*",
    "apigee.deployments.*",
    "apigee.developerapps.*",
    "apigee.developerappattributes.*",
    "apigee.developerattributes.*",
    ""

*/
