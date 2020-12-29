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
  Varables
 *****************************************/

variable "org_id" {
  description = "Org ID where this custom role will be created"
  type        = number
}

variable "custom_role_id" {
  description = "Custom role ID to be used. Default is: vpc_sc_update_custom"
  default     = "vpc_sc_update_custom"
  type        = string
}

variable "custom_role_friendly_name" {
  description = "Friendly name for role. Default: VPC SC Update Perimeter"
  default     = "VPC SC Update Perimeter"
  type        = string
}