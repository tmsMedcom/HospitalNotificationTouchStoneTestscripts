Instance: HS-send-IMP-Admit
InstanceOf: TestScript

* insert Metadata
* id = "HS-admit-imp-admit"
* name = "receive-notification-about-admission"
* title = "hospitalNotification-message admit-inpatient receiving XML"
* description = "Testing correct use of status admit-inpatient"

//Once per testscript
* insert createHNSendTest(STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STIN-UF_H_V_1.xml,
 admit-inpatient, IMP, in-progress) 


RuleSet: createHNSendTest(type, number, fixture, activityCode, encounterClass, encounterStatus)
* origin.index = 1
* origin.profile.system = "http://terminology.hl7.org/CodeSystem/testscript-profile-origin-types"
* origin.profile.code = #FHIR-Client

* destination.index = 1
* destination.profile.system = "http://terminology.hl7.org/CodeSystem/testscript-profile-destination-types"
* destination.profile.code = #FHIR-Server

* fixture[+].id = "bundle-create-{type}{number}"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "{fixture}"

* profile.id = "acknowledgment-profile"
* profile.reference = "http://medcomfhir.dk/fhir/core/1.0/StructureDefinition/medcom-messaging-acknowledgement" 

* variable[+].name = "encounterResourceIdentifier{type}{number}"
* variable[=].expression = "Bundle.entry.resource.ofType(Encounter).identifier.value"
* variable[=].sourceId = "bundle-create-{type}{number}"

* variable[+].name = "headerResourceReference{type}{number}"
* variable[=].expression = "Bundle.entry[0].fullUrl"
* variable[=].sourceId = "bundle-create-{type}{number}"

* variable[+].name = "firstEpisodeOfCareIdentifier{type}{number}"
* variable[=].expression = "Bundle.entry.resource.ofType(Encounter).episodeOfCare.identifier.value"
* variable[=].sourceId = "bundle-create-{type}{number}"


* test[+].id = "HN-{type}-{number}" 
* test[=].name = "{number} Post Hospitalnotification" 
* test[=].description = "Post Hospitalnotification" 
* test[=].action[+].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* test[=].action[=].operation.type.code = #create
* test[=].action[=].operation.resource = #Bundle
* test[=].action[=].operation.description = "Post a Hospitalnotification"
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.sourceId = "bundle-create-{type}{number}" 

* test[=].action[+].assert.description = "Confirm that the client request payload contains a Bundle resource type."
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.resource = #Bundle
* test[=].action[=].assert.warningOnly = false

* test[=].action[+].assert.description = "Confirm that the request resource contains the expected evetCoding code."
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(MessageHeader).event.as(Coding).select(code = 'hospital-notification-message').allTrue()"
* test[=].action[=].assert.warningOnly = false

* test[=].action[+].assert.description = "Confirm that the request resource contains the expected activity code."
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Provenance).activity.coding.code"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "{activityCode}"
* test[=].action[=].assert.warningOnly = false

* test[=].action[+].assert.description = "Confirm that the request resource contains the expected Encounter class code."
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Encounter).class.code"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "{encounterClass}"
* test[=].action[=].assert.warningOnly = false

* test[=].action[+].assert.description = "Confirm that the request resource contains the expected status."
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Encounter).status"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "{encounterStatus}"
* test[=].action[=].assert.warningOnly = false

* test[=].action[+].assert.description = "Confirm that the reportOfAdmissionRecipientExtension is set to true."
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(MessageHeader).extension.where(url='http://medcomfhir.dk/fhir/core/1.0/StructureDefinition/medcom-messaging-reportOfAdmissionExtension').value"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "true"
* test[=].action[=].assert.warningOnly = false

