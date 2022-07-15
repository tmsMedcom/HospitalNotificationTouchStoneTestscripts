
RuleSet: assertResponseCodeTest //Vurder om handlingen af testen er udført korrekt. 200 = okay, 201 = created.
* test[=].action[+].assert.description = "Confirm that the returned HTTP status is okay or created."
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.responseCode = "200,201"
* test[=].action[=].assert.operator = #in
* test[=].action[=].assert.warningOnly = false

RuleSet: assertResponseCodeSetup //Vurder om handlingen af setup'et er udført korrekt. 200 = okay, 201 = created.
* setup[=].action[+].assert.description = "Confirm that the returned HTTP status is okay or created."
* setup[=].action[=].assert.direction = #response
* setup[=].action[=].assert.responseCode = "200,201"
* setup[=].action[=].assert.operator = #in
* setup[=].action[=].assert.warningOnly = false

RuleSet: assertResponseNotFound //kan bruges til at bekræfte, at en meddelelse er slettet
* test[=].action[+].assert.description = "Confirm that the returned HTTP status is not found."
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.response = #notFound
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.warningOnly = false

RuleSet: assertValidateProfiles
* test[=].action[+].assert.description = "Validates the bundle against http://medcomfhir.dk/fhir/hospitalnotification/ImplementationGuide/dk.fhir.ig.dk-medcom-hospitalnotification" 
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.validateProfileId = "hospitalnotification"
* test[=].action[=].assert.warningOnly = false

RuleSet: assertMessageHeaderid
* test[=].action[+].assert.description = "Confirm that the previous MessageHeader fullURL is identical to Provenanve.entity.what" 
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Provenance).entity.what.reference"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "${headerResourceReference}"
* test[=].action[=].assert.warningOnly = false

RuleSet: assertPayload
* test[=].action[+].assert.description = "Confirm that the client request payload contains a Bundle resource type."
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.resource = #Bundle
* test[=].action[=].assert.warningOnly = false

RuleSet: assertMessageHeaderEventCoding
* test[=].action[+].assert.description = "Confirm that the request resource contains the expected eventCoding.code."
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(MessageHeader).event.as(Coding).select(code = 'hospital-notification-message').allTrue()"
* test[=].action[=].assert.warningOnly = false

RuleSet: assertProvenanceActivityCode(activityCode)
* test[=].action[+].assert.description = "Confirm that the request resource contains the expected activity code."
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Provenance).where(activity.coding.code = '{activityCode}').exists()"
* test[=].action[=].assert.warningOnly = false

RuleSet: assertEncounterClass(encounterClass)
* test[=].action[+].assert.description = "Confirm that the Encounter class of the request resource is {encounterClass}."
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Encounter).class.code"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "{encounterClass}"
* test[=].action[=].assert.warningOnly = false

RuleSet: assertEncounterStatus(encounterStatus)
* test[=].action[+].assert.description = "Confirm that the Encounter status of the request resource is {encounterStatus}."
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Encounter).status"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "{encounterStatus}"
* test[=].action[=].assert.warningOnly = false

RuleSet: assertEncounterReportOfAdmission(reportOfAdmission)
* test[=].action[+].assert.description = "Confirm that the report of admission flag is {reportOfAdmission}."
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(MessageHeader).extension.where(url='http://medcomfhir.dk/fhir/hospitalnotification/StructureDefinition/medcom-messaging-reportOfAdmissionExtension').value"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "{reportOfAdmission}"
* test[=].action[=].assert.warningOnly = false

RuleSet: assertProvenanceTarget
* test[=].action[+].assert.description = "Confirm that the target reference in Provenance equals MessageHeader.id"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Provenance).where(target.reference = %resource.entry[0].fullUrl).exists()"
* test[=].action[=].assert.warningOnly = false

RuleSet: assertProvenanceEntityExists
* test[=].action[+].assert.description = "Confirm that the Povenance.what reference exists. Not used when testing the first message in a stream."
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Provenance).entity.what.reference.count() > 0"
* test[=].action[=].assert.warningOnly = false 

RuleSet: assertProvenanceEntityRole(role)
* test[=].action[+].assert.description = "Confirm that the role is set to {role}. Not used when testing the first message in a stream"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Provenance).entity.role"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "{role}"
* test[=].action[=].assert.warningOnly = false

RuleSet: assertPatientDeceased(deceased)
* test[=].action[+].assert.description = "Confirm that the patient.deceased is set to {deceased}"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Patient).deceased"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "{deceased}"
* test[=].action[=].assert.warningOnly = false


