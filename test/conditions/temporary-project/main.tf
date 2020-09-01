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

resource "google_project_iam_member" "temporary_break_glass_project_iam_member" {
  project = var.project_id
  member  = "user:${var.user}"
  role    = var.role

  condition {
    expression = "request.time < duration(\"3600s\")"
    title = "temporary-break-glass-${var.project_id}"
  }
}

//
//resource "google_project_iam_member" "temporary_break_glass_project_iam_member" {
//  project = var.project_id
//  member  = "user:${var.user}"
//  role    = var.role
//
//  condition {
//    expression = "request.time < timestamp (\"${timeadd(timestamp(), var.duration, s)}\")"
//    title = "temporary-break-glass-${var.project_id}"
//  }
//}


//
//resource "google_project_iam_member" "temporary_break_glass_project_iam_member" {
//  project = var.project_id
//  member  = "user:${var.user}"
//  role    = var.role
//
//  condition {
//    expression = "request.time < timestamp (\"${timeadd(timestamp(), ${var.duration})}s\")"
//    title = "temporary-break-glass-${var.project_id}"
//  }
//}



//
//
//resource "google_project_iam_member" "temporary_break_glass_project_iam_member" {
//  project = var.project_id
//  member  = "user:${var.user}"
//  role    = var.role
//
//  condition {
//    expression = "request.time < timestamp (\"+ ${var.duration}\")"
//    title = "temporary-break-glass-${var.project_id}"
//  }
//}