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


/*

  I created the list below using https://cloud.google.com/iam/docs/custom-roles-permissions-support & Google Sheets
  I searched and removed all blocks of permissions which had "NOT_SUPPORTED". For some it was an entire method. For others,
  If it was only one permission (e.g. cloudsql.sslCerts.createEphemeral) then I pulled out all cloudsql.sslCert permissions.
  I then used functions to remove all verbs (create, delete, etc.). There may be a better way but I just used SPLIT function
  to break out using period as the deliminator. I then combined the first two columns (adding back the period). I then
  took all these values and pasted them in a new column using "paste values only". After that, I used the feature
  under Data to "Remove duplicates". Finally, I formatted so I could easily copy/paste to below. Again, I kept it simple,
  there is probably a better way, I used CHAR(34) to add quotes before and after each permission, and also added the .* to each
  (e.g. =CHAR(34)&A1&".*&CHAR(34) ) this assumes column A has your data. After this I just did a JOIN for all permissions,
  and I indicated to JOIN them and add a commo as well as start a new line. (e.g. =JOIN(","&CHAR(10),B1:B644) ) This assumes
  you data is now in column B. I then made use of copy/paste values again and entered values below.

*/


variable "permissions" {
  type = list(string)
  description = "List of permissions desired for role. Default includes many project permissions (close to owner)"
  default = [

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
    "apigee.canaryevaluations.*",
    "apigee.datacollectors.*",
    "apigee.datastores.*",
    "apigee.deployments.*",
    "apigee.developerappattributes.*",
    "apigee.developerapps.*",
    "apigee.developerattributes.*",
    "apigee.developers.*",
    "apigee.envgroupattachments.*",
    "apigee.envgroups.*",
    "apigee.environments.*",
    "apigee.exports.*",
    "apigee.flowhooks.*",
    "apigee.hostqueries.*",
    "apigee.hoststats.*",
    "apigee.ingressconfigs.*",
    "apigee.instanceattachments.*",
    "apigee.instances.*",
    "apigee.keystorealiases.*",
    "apigee.keystores.*",
    "apigee.keyvaluemaps.*",
    "apigee.maskconfigs.*",
    "apigee.operations.*",
    "apigee.organizations.*",
    "apigee.projects.*",
    "apigee.proxies.*",
    "apigee.proxyrevisions.*",
    "apigee.queries.*",
    "apigee.references.*",
    "apigee.reports.*",
    "apigee.resourcefiles.*",
    "apigee.sharedflowrevisions.*",
    "apigee.sharedflows.*",
    "apigee.targetservers.*",
    "apigee.tracesessions.*",
    "apigeeconnect.connections.*",
    "apigeeconnect.endpoints.*",
    "apikeys.keys.*",
    "appengine.applications.*",
    "appengine.instances.*",
    "appengine.memcache.*",
    "appengine.operations.*",
    "appengine.services.*",
    "appengine.versions.*",
    "artifactregistry.files.*",
    "artifactregistry.packages.*",
    "artifactregistry.repositories.*",
    "artifactregistry.tags.*",
    "artifactregistry.versions.*",
    "assuredworkloads.operations.*",
    "assuredworkloads.workload.*",
    "automl.annotationSpecs.*",
    "automl.annotations.*",
    "automl.columnSpecs.*",
    "automl.datasets.*",
    "automl.examples.*",
    "automl.humanAnnotationTasks.*",
    "automl.locations.*",
    "automl.modelEvaluations.*",
    "automl.models.*",
    "automl.operations.*",
    "automl.tableSpecs.*",
    "automlrecommendations.apiKeys.*",
    "automlrecommendations.catalogItems.*",
    "automlrecommendations.catalogs.*",
    "automlrecommendations.eventStores.*",
    "automlrecommendations.events.*",
    "automlrecommendations.placements.*",
    "automlrecommendations.recommendations.*",
    "axt.labels.*",
    "bigquery.bireservations.*",
    "bigquery.capacityCommitments.*",
    "bigquery.config.*",
    "bigquery.connections.*",
    "bigquery.datasets.*",
    "bigquery.jobs.*",
    "bigquery.models.*",
    "bigquery.readsessions.*",
    "bigquery.reservationAssignments.*",
    "bigquery.reservations.*",
    "bigquery.routines.*",
    "bigquery.savedqueries.*",
    "bigquery.tables.*",
    "bigquery.transfers.*",
    "bigtable.appProfiles.*",
    "bigtable.backups.*",
    "bigtable.clusters.*",
    "bigtable.instances.*",
    "bigtable.keyvisualizer.*",
    "bigtable.locations.*",
    "bigtable.tables.*",
    #"billing.accounts.*",
    "billing.budgets.*",
    "billing.credits.*",
    "billing.resourceAssociations.*",
    "billing.resourceCosts.*",
    "billing.subscriptions.*",
    "binaryauthorization.attestors.*",
    "binaryauthorization.policy.*",
    "chat.bots.*",
    "clientauthconfig.brands.*",
    "clientauthconfig.clients.*",
    "cloudasset.assets.*",
    "cloudasset.feeds.*",
    "cloudbuild.builds.*",
    "cloudconfig.configs.*",
    "clouddebugger.breakpoints.*",
    "clouddebugger.debuggees.*",
    "cloudfunctions.functions.*",
    "cloudfunctions.locations.*",
    "cloudfunctions.operations.*",
    "cloudiot.devices.*",
    "cloudiot.registries.*",
    "cloudiottoken.tokensettings.*",
    "cloudjobdiscovery.companies.*",
    "cloudjobdiscovery.events.*",
    "cloudjobdiscovery.jobs.*",
    "cloudjobdiscovery.profiles.*",
    "cloudjobdiscovery.tenants.*",
    "cloudjobdiscovery.tools.*",
    "cloudkms.cryptoKeyVersions.*",
    "cloudkms.cryptoKeys.*",
    "cloudkms.importJobs.*",
    "cloudkms.keyRings.*",
    "cloudmessaging.messages.*",
    "cloudnotifications.activities.*",
    "cloudprivatecatalog.targets.*",
    "cloudprivatecatalogproducer.associations.*",
    "cloudprivatecatalogproducer.catalogs.*",
    "cloudprivatecatalogproducer.targets.*",
    "cloudprofiler.profiles.*",
    "cloudscheduler.jobs.*",
    "cloudscheduler.locations.*",
    "cloudsecurityscanner.crawledurls.*",
    "cloudsecurityscanner.results.*",
    "cloudsecurityscanner.scanruns.*",
    "cloudsecurityscanner.scans.*",
    "cloudsql.backupRuns.*",
    "cloudsql.databases.*",
    "cloudsql.instances.*",
    "cloudsql.users.*",
    "cloudsupport.accounts.*",
    "cloudsupport.operations.*",
    "cloudsupport.properties.*",
    "cloudsupport.techCases.*",
    "cloudtasks.locations.*",
    "cloudtasks.queues.*",
    "cloudtasks.tasks.*",
    "cloudtestservice.environmentcatalog.*",
    "cloudtestservice.matrices.*",
    "cloudtoolresults.executions.*",
    "cloudtoolresults.histories.*",
    "cloudtoolresults.settings.*",
    "cloudtoolresults.steps.*",
    "cloudtrace.insights.*",
    "cloudtrace.stats.*",
    "cloudtrace.tasks.*",
    "cloudtrace.traces.*",
    "cloudtranslate.generalModels.*",
    "cloudtranslate.glossaries.*",
    "cloudtranslate.languageDetectionModels.*",
    "cloudtranslate.locations.*",
    "cloudtranslate.operations.*",
    "composer.environments.*",
    "composer.imageversions.*",
    "composer.operations.*",
    "compute.acceleratorTypes.*",
    "compute.addresses.*",
    "compute.autoscalers.*",
    "compute.backendBuckets.*",
    "compute.backendServices.*",
    "compute.commitments.*",
    "compute.diskTypes.*",
    "compute.disks.*",
    "compute.externalVpnGateways.*",
    "compute.firewalls.*",
    "compute.forwardingRules.*",
    "compute.globalAddresses.*",
    "compute.globalForwardingRules.*",
    "compute.globalOperations.*",
    "compute.globalPublicDelegatedPrefixes.*",
    "compute.healthChecks.*",
    "compute.httpHealthChecks.*",
    "compute.httpsHealthChecks.*",
    "compute.images.*",
    "compute.instanceGroupManagers.*",
    "compute.instanceGroups.*",
    "compute.instanceTemplates.*",
    "compute.instances.*",
    "compute.interconnectAttachments.*",
    "compute.interconnectLocations.*",
    "compute.interconnects.*",
    "compute.licenseCodes.*",
    "compute.licenses.*",
    "compute.machineTypes.*",
    "compute.maintenancePolicies.*",
    "compute.networkEndpointGroups.*",
    "compute.networks.*",
    "compute.nodeGroups.*",
    "compute.nodeTemplates.*",
    "compute.nodeTypes.*",
    "compute.oslogin.*",
    "compute.packetMirrorings.*",
    "compute.projects.*",
    "compute.publicAdvertisedPrefixes.*",
    "compute.publicDelegatedPrefixes.*",
    "compute.regionBackendServices.*",
    "compute.regionHealthCheckServices.*",
    "compute.regionNotificationEndpoints.*",
    "compute.regionOperations.*",
    "compute.regions.*",
    "compute.reservations.*",
    "compute.resourcePolicies.*",
    "compute.routers.*",
    "compute.routes.*",
    "compute.securityPolicies.*",
    "compute.snapshots.*",
    "compute.sslCertificates.*",
    "compute.sslPolicies.*",
    "compute.subnetworks.*",
    "compute.targetHttpProxies.*",
    "compute.targetHttpsProxies.*",
    "compute.targetInstances.*",
    "compute.targetPools.*",
    "compute.targetSslProxies.*",
    "compute.targetTcpProxies.*",
    "compute.targetVpnGateways.*",
    "compute.urlMaps.*",
    "compute.vpnGateways.*",
    "compute.vpnTunnels.*",
    "compute.zoneOperations.*",
    "compute.zones.*",
    "consumerprocurement.accounts.*",
    "consumerprocurement.entitlements.*",
    "consumerprocurement.freeTrials.*",
    "consumerprocurement.orders.*",
    "container.apiServices.*",
    "container.backendConfigs.*",
    "container.bindings.*",
    "container.certificateSigningRequests.*",
    "container.clusterRoleBindings.*",
    "container.clusterRoles.*",
    "container.clusters.*",
    "container.componentStatuses.*",
    "container.configMaps.*",
    "container.controllerRevisions.*",
    "container.cronJobs.*",
    "container.csiDrivers.*",
    "container.csiNodes.*",
    "container.customResourceDefinitions.*",
    "container.daemonSets.*",
    "container.deployments.*",
    "container.endpoints.*",
    "container.events.*",
    "container.horizontalPodAutoscalers.*",
    "container.hostServiceAgent.*",
    "container.ingresses.*",
    "container.initializerConfigurations.*",
    "container.jobs.*",
    "container.limitRanges.*",
    "container.localSubjectAccessReviews.*",
    "container.namespaces.*",
    "container.networkPolicies.*",
    "container.nodes.*",
    "container.operations.*",
    "container.persistentVolumeClaims.*",
    "container.persistentVolumes.*",
    "container.petSets.*",
    "container.podDisruptionBudgets.*",
    "container.podPresets.*",
    "container.podSecurityPolicies.*",
    "container.podTemplates.*",
    "container.pods.*",
    "container.replicaSets.*",
    "container.replicationControllers.*",
    "container.resourceQuotas.*",
    "container.roleBindings.*",
    "container.roles.*",
    "container.runtimeClasses.*",
    "container.scheduledJobs.*",
    "container.secrets.*",
    "container.selfSubjectAccessReviews.*",
    "container.serviceAccounts.*",
    "container.services.*",
    "container.statefulSets.*",
    "container.storageClasses.*",
    "container.subjectAccessReviews.*",
    "container.thirdPartyObjects.*",
    "container.thirdPartyResources.*",
    "container.tokenReviews.*",
    "containeranalysis.notes.*",
    "containeranalysis.occurrences.*",
    "datacatalog.categories.*",
    "datacatalog.entries.*",
    "datacatalog.entryGroups.*",
    "datacatalog.tagTemplates.*",
    "datacatalog.taxonomies.*",
    "dataflow.jobs.*",
    "dataflow.messages.*",
    "dataflow.metrics.*",
    "dataflow.snapshots.*",
    "datafusion.instances.*",
    "datafusion.locations.*",
    "datafusion.operations.*",
    "datalabeling.annotateddatasets.*",
    "datalabeling.annotationspecsets.*",
    "datalabeling.dataitems.*",
    "datalabeling.datasets.*",
    "datalabeling.examples.*",
    "datalabeling.instructions.*",
    "datalabeling.operations.*",
    "dataprep.projects.*",
    "dataproc.agents.*",
    "dataproc.autoscalingPolicies.*",
    "dataproc.clusters.*",
    "dataproc.jobs.*",
    "dataproc.operations.*",
    #"dataproc.tasks.*",
    "dataproc.workflowTemplates.*",
    "dataprocessing.featurecontrols.*",
    "dataprocessing.groupcontrols.*",
    "deploymentmanager.compositeTypes.*",
    "deploymentmanager.deployments.*",
    "deploymentmanager.manifests.*",
    "deploymentmanager.operations.*",
    "deploymentmanager.resources.*",
    "deploymentmanager.typeProviders.*",
    "deploymentmanager.types.*",
    "dialogflow.agents.*",
    "dialogflow.contexts.*",
    "dialogflow.documents.*",
    "dialogflow.entityTypes.*",
    "dialogflow.environments.*",
    "dialogflow.flows.*",
    "dialogflow.fulfillments.*",
    "dialogflow.intents.*",
    "dialogflow.knowledgeBases.*",
    "dialogflow.operations.*",
    "dialogflow.pages.*",
    "dialogflow.sessionEntityTypes.*",
    "dialogflow.sessions.*",
    "dialogflow.transitionRouteGroups.*",
    "dialogflow.versions.*",
    "dialogflow.webhooks.*",
    "dlp.analyzeRiskTemplates.*",
    "dlp.deidentifyTemplates.*",
    "dlp.inspectFindings.*",
    "dlp.inspectTemplates.*",
    "dlp.jobTriggers.*",
    "dlp.jobs.*",
    "dlp.kms.*",
    "dlp.storedInfoTypes.*",
    "dns.changes.*",
    "dns.dnsKeys.*",
    "dns.managedZoneOperations.*",
    "dns.managedZones.*",
    "dns.networks.*",
    "dns.policies.*",
    "dns.projects.*",
    "dns.resourceRecordSets.*",
    "endpoints.portals.*",
    "errorreporting.applications.*",
    "errorreporting.errorEvents.*",
    "errorreporting.groupMetadata.*",
    "errorreporting.groups.*",
    "file.backups.*",
    "file.instances.*",
    "file.locations.*",
    "file.operations.*",
    "file.snapshots.*",
    "firebase.billingPlans.*",
    "firebase.clients.*",
    "firebase.links.*",
    "firebase.projects.*",
    "firebaseabt.experimentresults.*",
    "firebaseabt.experiments.*",
    "firebaseabt.projectmetadata.*",
    "firebaseanalytics.resources.*",
    "firebaseappdistro.groups.*",
    "firebaseappdistro.releases.*",
    "firebaseappdistro.testers.*",
    "firebaseauth.configs.*",
    "firebaseauth.users.*",
    "firebasecrash.issues.*",
    "firebasecrash.reports.*",
    "firebasecrashlytics.config.*",
    "firebasecrashlytics.data.*",
    "firebasecrashlytics.issues.*",
    "firebasecrashlytics.sessions.*",
    "firebasedatabase.instances.*",
    "firebasedynamiclinks.destinations.*",
    "firebasedynamiclinks.domains.*",
    "firebasedynamiclinks.links.*",
    "firebasedynamiclinks.stats.*",
    "firebaseextensions.configs.*",
    "firebasehosting.sites.*",
    "firebaseinappmessaging.campaigns.*",
    "firebaseml.compressionjobs.*",
    "firebaseml.models.*",
    "firebaseml.modelversions.*",
    "firebasenotifications.messages.*",
    "firebaseperformance.config.*",
    "firebaseperformance.data.*",
    "firebasepredictions.predictions.*",
    "firebaserules.releases.*",
    "firebaserules.rulesets.*",
    "gameservices.gameServerClusters.*",
    "gameservices.gameServerConfigs.*",
    "gameservices.gameServerDeployments.*",
    "gameservices.locations.*",
    "gameservices.operations.*",
    "gameservices.realms.*",
    "genomics.datasets.*",
    "genomics.operations.*",
    "gkehub.endpoints.*",
    "gkehub.gateway.*",
    "gkehub.locations.*",
    "gkehub.memberships.*",
    "gkehub.operations.*",
    "healthcare.annotationStores.*",
    "healthcare.annotations.*",
    "healthcare.datasets.*",
    "healthcare.dicomStores.*",
    "healthcare.fhirResources.*",
    "healthcare.fhirStores.*",
    "healthcare.hl7V2Messages.*",
    "healthcare.hl7V2Stores.*",
    "healthcare.locations.*",
    "healthcare.operations.*",
    "iam.roles.*",
    "iam.serviceAccountKeys.*",
    "iam.serviceAccounts.*",
    "iap.projects.*",
    "iap.tunnel.*",
    "iap.tunnelInstances.*",
    "iap.tunnelZones.*",
    "iap.web.*",
    "iap.webServiceVersions.*",
    "iap.webServices.*",
    "iap.webTypes.*",
    "identityplatform.workloadPoolProviders.*",
    "identityplatform.workloadPools.*",
    "lifesciences.operations.*",
    "lifesciences.workflows.*",
    "logging.buckets.*",
    "logging.cmekSettings.*",
    "logging.exclusions.*",
    "logging.logEntries.*",
    "logging.logMetrics.*",
    "logging.logServiceIndexes.*",
    "logging.logServices.*",
    "logging.logs.*",
    "logging.privateLogEntries.*",
    "logging.queries.*",
    "logging.sinks.*",
    "logging.usage.*",
    "logging.views.*",
    "managedidentities.domains.*",
    "managedidentities.locations.*",
    "managedidentities.operations.*",
    "memcache.instances.*",
    "memcache.locations.*",
    "memcache.operations.*",
    "ml.jobs.*",
    "ml.locations.*",
    "ml.models.*",
    "ml.operations.*",
    "ml.projects.*",
    "ml.studies.*",
    "ml.trials.*",
    "ml.versions.*",
    "monitoring.alertPolicies.*",
    "monitoring.dashboards.*",
    "monitoring.groups.*",
    "monitoring.metricDescriptors.*",
    "monitoring.monitoredResourceDescriptors.*",
    "monitoring.notificationChannelDescriptors.*",
    "monitoring.notificationChannels.*",
    "monitoring.publicWidgets.*",
    "monitoring.services.*",
    "monitoring.slos.*",
    "monitoring.timeSeries.*",
    "monitoring.uptimeCheckConfigs.*",
    "networkmanagement.connectivitytests.*",
    "networkmanagement.locations.*",
    "networkmanagement.operations.*",
    "networksecurity.authorizationPolicies.*",
    "networksecurity.clientTlsPolicies.*",
    "networksecurity.locations.*",
    "networksecurity.operations.*",
    "networksecurity.serverTlsPolicies.*",
    "networkservices.endpointConfigSelectors.*",
    "networkservices.httpFilters.*",
    "networkservices.locations.*",
    "networkservices.operations.*",
    "notebooks.environments.*",
    "notebooks.instances.*",
    "notebooks.locations.*",
    "notebooks.operations.*",
    "oauthconfig.clientpolicy.*",
    "oauthconfig.testusers.*",
    "oauthconfig.verification.*",
    "oauthpolicymetadata.brandpolicy.*",
    "oauthpolicymetadata.clientpolicy.*",
    "oauthtestapp.userwhitelist.*",
    "opsconfigmonitoring.resourceMetadata.*",
    "osconfig.guestPolicies.*",
    "osconfig.patchDeployments.*",
    "osconfig.patchJobs.*",
    "privateca.certificateAuthorities.*",
    "privateca.certificateRevocationLists.*",
    "privateca.certificates.*",
    "privateca.locations.*",
    "privateca.operations.*",
    "privateca.reusableConfigs.*",
    "proximitybeacon.attachments.*",
    "proximitybeacon.beacons.*",
    "proximitybeacon.namespaces.*",
    "pubsub.snapshots.*",
    "pubsub.subscriptions.*",
    "pubsub.topics.*",
    "pubsublite.subscriptions.*",
    "pubsublite.topics.*",
    "recaptchaenterprise.assessments.*",
    "recaptchaenterprise.keys.*",
    "recaptchaenterprise.metrics.*",
    "recommender.commitmentUtilizationInsights.*",
    "recommender.computeDiskIdleResourceInsights.*",
    "recommender.computeDiskIdleResourceRecommendations.*",
    "recommender.computeFirewallInsights.*",
    "recommender.computeInstanceGroupManagerMachineTypeRecommendations.*",
    "recommender.computeInstanceIdleResourceRecommendations.*",
    "recommender.computeInstanceMachineTypeRecommendations.*",
    "recommender.iamPolicyInsights.*",
    "recommender.iamPolicyRecommendations.*",
    "recommender.iamServiceAccountInsights.*",
    "recommender.locations.*",
    "recommender.usageCommitmentRecommendations.*",
    "redis.instances.*",
    "redis.locations.*",
    "redis.operations.*",
    "remotebuildexecution.actions.*",
    "remotebuildexecution.blobs.*",
    "remotebuildexecution.botsessions.*",
    "remotebuildexecution.instances.*",
    "remotebuildexecution.logstreams.*",
    "remotebuildexecution.workerpools.*",
    "resourcemanager.folders.*",
    "resourcemanager.organizations.*",
    "resourcemanager.projects.*",
    "run.configurations.*",
    "run.locations.*",
    "run.revisions.*",
    "run.services.*",
    "runtimeconfig.configs.*",
    "runtimeconfig.operations.*",
    "runtimeconfig.variables.*",
    "runtimeconfig.waiters.*",
    "secretmanager.locations.*",
    "secretmanager.secrets.*",
    "secretmanager.versions.*",
    "securitycenter.assets.*",
    "securitycenter.assetsecuritymarks.*",
    "securitycenter.containerthreatdetectionsettings.*",
    "securitycenter.eventthreatdetectionsettings.*",
    "securitycenter.findings.*",
    "securitycenter.findingsecuritymarks.*",
    "securitycenter.notificationconfig.*",
    "securitycenter.organizationsettings.*",
    "securitycenter.securitycentersettings.*",
    "securitycenter.securityhealthanalyticssettings.*",
    "securitycenter.sources.*",
    "securitycenter.subscription.*",
    "securitycenter.websecurityscannersettings.*",
    "servicebroker.bindingoperations.*",
    "servicebroker.bindings.*",
    "servicebroker.catalogs.*",
    "servicebroker.instanceoperations.*",
    "servicebroker.instances.*",
    "serviceconsumermanagement.consumers.*",
    "serviceconsumermanagement.quota.*",
    "serviceconsumermanagement.tenancyu.*",
    "servicedirectory.endpoints.*",
    "servicedirectory.locations.*",
    "servicedirectory.namespaces.*",
    "servicedirectory.services.*",
    "servicemanagement.services.*",
    "servicenetworking.operations.*",
    "servicenetworking.services.*",
    "serviceusage.apiKeys.*",
    "serviceusage.operations.*",
    "serviceusage.quotas.*",
    "serviceusage.services.*",
    "spanner.backupOperations.*",
    "spanner.backups.*",
    "spanner.instanceConfigs.*",
    "spanner.instanceOperations.*",
    "spanner.instances.*",
    "spanner.sessions.*",
    "stackdriver.resourceMetadata.*",
    "storage.buckets.*",
    "storage.hmacKeys.*",
    "storage.objects.*",
    "storagetransfer.jobs.*",
    "storagetransfer.operations.*",
    "storagetransfer.projects.*",
    "subscribewithgoogledeveloper.tools.*",
    "threatdetection.detectorSettings.*",
    "threatdetection.sinkSettings.*",
    "threatdetection.sourceSettings.*",
    "tpu.acceleratortypes.*",
    "tpu.locations.*",
    "tpu.nodes.*",
    "tpu.operations.*",
    "tpu.tensorflowversions.*",
    "vmmigration.deployments.*",
    "vmwareengine.services.*",
    "vpcaccess.connectors.*",
    "vpcaccess.locations.*",
    "vpcaccess.operations.*",
    "workflows.executions.*",
    "workflows.locations.*",
    "workflows.operations.*",
    "workflows.workflows.*"

  ]

}