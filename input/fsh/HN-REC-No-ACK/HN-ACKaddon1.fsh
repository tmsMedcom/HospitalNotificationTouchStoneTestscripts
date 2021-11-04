RuleSet: ACKRuleAddOn(hnfixtureId,type)
* fixture[+].id = "bundle-create-ack-ok"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "/FHIRSandbox/MedCom/401-Acknowledgement/_reference/resources/Acknowledgement-ok.xml"

* profile.id = "acknowledgment-profile"
* profile.reference = "http://medcomfhir.dk/fhir/core/1.0/StructureDefinition/medcom-messaging-acknowledgement"

* variable[+].name = "destinationUri"
* variable[=].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
* variable[=].sourceId = {hnfixtureId}

* variable[+].name = "headerResourceReference"
* variable[=].expression = "Bundle.entry[0].fullUrl"
* variable[=].sourceId = "bundle-create-ack-ok"

* variable[+].name = "bundleResourceid{type}"
* variable[=].expression = "Bundle.id"
* variable[=].sourceId = {hnfixtureId}

* variable[+].name = "MessageHeaderIdentifier{type}"
* variable[=].expression = "Bundle.entry[0].fullUrl"
* variable[=].sourceId = {hnfixtureId}

RuleSet: ACKRulesetTest (noOfACK, type)
* test[+].id = "02-ACK-01-ok"
* test[=].name = "Post Acknowledgement {noOfACK}"
* test[=].description = "Post acknowledgement"
* test[=].action[+].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* test[=].action[=].operation.type.code = #create
* test[=].action[=].operation.resource = #Bundle
* test[=].action[=].operation.description = "Post a acknowledgement"
* test[=].action[=].operation.accept = #xml
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.sourceId = "bundle-create-ack-ok"

* test[=].action[+].assert.description = "Confirm that the client request payload contains a Bundle resource type."
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.resource = #Bundle
* test[=].action[=].assert.warningOnly = false

* test[=].action[+].assert.description = "Confirm that the MessageHeader response code is FixtureRefferenceok"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(MessageHeader).response.code"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "ok"
* test[=].action[=].assert.warningOnly = false

* insert OperationOutcomeNot

* test[=].action[+].assert.description = "Confirm that the MessageHeader.response.identifier is equal to Id of original message "
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(MessageHeader).response.identifier"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "${bundleResourceid{type}}"
* test[=].action[=].assert.warningOnly = false

* test[=].action[+].assert.description = "Confirm that the reference original Provenance.entity.what is equal to Id of original messageheader.identifier"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Provenance).where(entity.what.reference ='${MessageHeaderIdentifier{type}}')"
* test[=].action[=].assert.warningOnly = false