RuleSet: ACKRule(id,MessageHeaderResponseCode, Metadata, OperationOutcome)
* id = "{id}"
* insert {Metadata}
* name = "medcom-Acknowledgement-{MessageHeaderResponseCode}-xml-json"
* title = "medcom-Acknowledgement-{MessageHeaderResponseCode}"

* description = "Testing correct use of acknowledgment"
* origin.index = 1
* origin.profile.system = "http://terminology.hl7.org/CodeSystem/testscript-profile-origin-types"
* origin.profile.code = #FHIR-Client
* destination.index = 1
* destination.profile.system = "http://terminology.hl7.org/CodeSystem/testscript-profile-destination-types"
* destination.profile.code = #FHIR-Server

* fixture[+].id = "bundle-create-STIN"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "/FHIRSandbox/MedCom/401-Acknowledgement/_reference/resources/HSN.xml"

* fixture[+].id = "bundle-create-ack-{MessageHeaderResponseCode}"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "/FHIRSandbox/MedCom/401-Acknowledgement/_reference/resources/ACK-{MessageHeaderResponseCode}.xml"

* profile.id = "acknowledgment-profile"
* profile.reference = "http://medcomfhir.dk/fhir/core/1.0/StructureDefinition/medcom-messaging-acknowledgement"

* variable[+].name = "destinationUri"
* variable[=].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
* variable[=].sourceId = "bundle-create-STIN"

* variable[+].name = "bundleResourceid"
* variable[=].expression = "Bundle.id"
* variable[=].sourceId = "bundle-create-STIN"

* variable[+].name = "MessageHeaderIdentifier"
* variable[=].expression = "Bundle.entry[0].fullUrl"
* variable[=].sourceId = "bundle-create-STIN"

//SKAL måske ikke med
* variable[+].name = "headerResourceReference"
* variable[=].expression = "Bundle.entry[0].fullUrl"
* variable[=].sourceId = "bundle-create-ack-{MessageHeaderResponseCode}"

* setup.action[+].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[=].operation.type.code = #delete
* setup.action[=].operation.resource = #Bundle
* setup.action[=].operation.description = "System-generated search and delete operations from conditional delete on Bundle MessageHeader).destination.endpoint"
* setup.action[=].operation.accept = #xml
* setup.action[=].operation.encodeRequestUrl = true

* setup.action[=].operation.params = "?message.destination-uri=${destinationUri}"
* setup.action[=].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[=].operation.type.code = #create
* setup.action[=].operation.resource = #Bundle
* setup.action[=].operation.description = "Create the Bundle resource in XML format on the destination server."
* setup.action[=].operation.accept = #xml
* setup.action[=].operation.contentType = #xml
* setup.action[=].operation.encodeRequestUrl = true
* setup.action[=].operation.sourceId = "bundle-create-STIN"

* setup.action[+].assert.description = "Confirm that the returned HTTP status is 201(Created)."
* setup.action[=].assert.direction = #response
* setup.action[=].assert.responseCode = "201"
* setup.action[=].assert.warningOnly = false
* test[+].id = "01-ACK-get-HN"
* test[=].name = "Get-HospitalNotification"
* test[=].description = "GET a Hospital notification"
* test[=].action[0].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* test[=].action[0].operation.type.code = #read
* test[=].action[0].operation.resource = #Bundle
* test[=].action[0].operation.description = "Receive notification about admission"
* test[=].action[0].operation.accept = #xml
* test[=].action[0].operation.destination = 1
* test[=].action[0].operation.encodeRequestUrl = true
* test[=].action[0].operation.origin = 1
* test[=].action[0].operation.params = "?message.destination-uri=${destinationUri}"
* test[=].action[0].operation.responseId = "Hn-get"

* test[=].action[1].assert.description = "Confirm that the returned HTTP status is 200(OK)."
* test[=].action[1].assert.direction = #response
* test[=].action[1].assert.responseCode = "200"
* test[=].action[1].assert.warningOnly = false

* test[+].id = "02-ACK-01-{MessageHeaderResponseCode}"
* test[=].name = "Post Acknowledgement"
* test[=].description = "GET a Hospital notification"
* test[=].action[+].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* test[=].action[=].operation.type.code = #create
* test[=].action[=].operation.resource = #Bundle
* test[=].action[=].operation.description = "Post a acknowledgement"
* test[=].action[=].operation.accept = #xml
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.sourceId = "bundle-create-ack-{MessageHeaderResponseCode}"

* test[=].action[+].assert.description = "Confirm that the client request payload contains a Bundle resource type."
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.resource = #Bundle
* test[=].action[=].assert.warningOnly = false

* test[=].action[+].assert.description = "Confirm that the MessageHeader response code is {MessageHeaderResponseCode}"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(MessageHeader).response.code"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "{MessageHeaderResponseCode}"
* test[=].action[=].assert.warningOnly = false

* insert {OperationOutcome}

* test[=].action[+].assert.description = "Confirm that the MessageHeader.response.identifier is equal to Id of original message "
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(MessageHeader).response.identifier"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "${bundleResourceid}"
* test[=].action[=].assert.warningOnly = false

* test[=].action[+].assert.description = "Confirm that the reference original Provenance.entity.what is equal to Id of original messageheader.identifier"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Provenance).where(entity.what.reference ='${MessageHeaderIdentifier}')"
* test[=].action[=].assert.warningOnly = false


RuleSet: OperationOutcomeNot
* test[=].action[+].assert.description = "Confirm that the Bundle not containing a OperationOutcome"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(OperationOutcome).exists().not()"
* test[=].action[=].assert.warningOnly = false

RuleSet: OperationOutcome
* test[=].action[+].assert.description = "Confirm that the Bundle containing a OperationOutcome"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(OperationOutcome).exists()"
* test[=].action[=].assert.warningOnly = false