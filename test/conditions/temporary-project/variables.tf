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

variable "user" {
  type        = string
  description = "User (email) that will be used to access project"
}

variable "project_id" {
  type        = string
  description = "Project ID to apply IAM policy"
}

variable "role" {
  type        = string
  description = "Role you want to grant. Default is roles/compute.admin"
  default     = "roles/compute.admin"
}

variable "duration" {
  type        = string
  description = "Duration in seconds for permission to last. Default is 3600s. Must include s at the end"
  default     = "3600s"
}