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

* fixture[0].id = "bundle-create-STIN"
* fixture[0].autocreate = false
* fixture[0].autodelete = false
* fixture[0].resource.reference = "/FHIRSandbox/MedCom/401-Acknowledgement/_reference/resources/HSN.xml"

* fixture[1].id = "bundle-create-ack-{MessageHeaderResponseCode}"
* fixture[1].autocreate = false
* fixture[1].autodelete = false
* fixture[1].resource.reference = "/FHIRSandbox/MedCom/401-Acknowledgement/_reference/resources/ACK-{MessageHeaderResponseCode}.xml"

* profile.id = "acknowledgment-profile"
* profile.reference = "http://medcomfhir.dk/fhir/core/1.0/StructureDefinition/medcom-messaging-acknowledgement"

* variable[0].name = "destinationUri"
* variable[0].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
* variable[0].sourceId = "bundle-create-STIN"

* variable[2].name = "bundleResourceid"
* variable[2].expression = "Bundle.id"
* variable[2].sourceId = "bundle-create-STIN"

* variable[3].name = "MessageHeaderIdentifier"
* variable[3].expression = "Bundle.entry[0].fullUrl"
* variable[3].sourceId = "bundle-create-STIN"

//SKAL måske ikke med
* variable[1].name = "headerResourceReference"
* variable[1].expression = "Bundle.entry[0].fullUrl"
* variable[1].sourceId = "bundle-create-ack-{MessageHeaderResponseCode}"

* setup.action[0].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[0].operation.type.code = #delete
* setup.action[0].operation.resource = #Bundle
* setup.action[0].operation.description = "System-generated search and delete operations from conditional delete on Bundle MessageHeader).destination.endpoint"
* setup.action[0].operation.accept = #xml
* setup.action[0].operation.encodeRequestUrl = true

* setup.action[0].operation.params = "?message.destination-uri=${destinationUri}"
* setup.action[1].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[1].operation.type.code = #create
* setup.action[1].operation.resource = #Bundle
* setup.action[1].operation.description = "Create the Bundle resource in XML format on the destination server."
* setup.action[1].operation.accept = #xml
* setup.action[1].operation.contentType = #xml
* setup.action[1].operation.encodeRequestUrl = true
* setup.action[1].operation.sourceId = "bundle-create-STIN"

* setup.action[2].assert.description = "Confirm that the returned HTTP status is 201(Created)."
* setup.action[2].assert.direction = #response
* setup.action[2].assert.responseCode = "201"
* setup.action[2].assert.warningOnly = false
* test[0].id = "01-ACK-get-HN"
* test[0].name = "Get-HospitalNotification"
* test[0].description = "GET a Hospital notification"
* test[0].action[0].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* test[0].action[0].operation.type.code = #read
* test[0].action[0].operation.resource = #Bundle
* test[0].action[0].operation.description = "Receive notification about admission"
* test[0].action[0].operation.accept = #xml
* test[0].action[0].operation.destination = 1
* test[0].action[0].operation.encodeRequestUrl = true
* test[0].action[0].operation.origin = 1
* test[0].action[0].operation.params = "?message.destination-uri=${destinationUri}"
* test[0].action[0].operation.responseId = "Hn-get"

* test[0].action[1].assert.description = "Confirm that the returned HTTP status is 200(OK)."
* test[0].action[1].assert.direction = #response
* test[0].action[1].assert.responseCode = "200"
* test[0].action[1].assert.warningOnly = false

* test[1].id = "02-ACK-01-{MessageHeaderResponseCode}"
* test[1].name = "Post Acknowledgement"
* test[1].description = "GET a Hospital notification"
* test[1].action[0].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* test[1].action[0].operation.type.code = #create
* test[1].action[0].operation.resource = #Bundle
* test[1].action[0].operation.description = "Post a acknowledgement"
* test[1].action[0].operation.accept = #xml
* test[1].action[0].operation.destination = 1
* test[1].action[0].operation.encodeRequestUrl = true
* test[1].action[0].operation.origin = 1
* test[1].action[0].operation.sourceId = "bundle-create-ack-{MessageHeaderResponseCode}"

* test[1].action[1].assert.description = "Confirm that the client request payload contains a Bundle resource type."
* test[1].action[1].assert.direction = #request
* test[1].action[1].assert.resource = #Bundle
* test[1].action[1].assert.warningOnly = false

* test[1].action[2].assert.description = "Confirm that the MessageHeader response code is {MessageHeaderResponseCode}"
* test[1].action[2].assert.direction = #request
* test[1].action[2].assert.expression = "Bundle.entry.resource.ofType(MessageHeader).response.code"
* test[1].action[2].assert.operator = #equals
* test[1].action[2].assert.value = "{MessageHeaderResponseCode}"
* test[1].action[2].assert.warningOnly = false

* insert {OperationOutcome}

* test[1].action[4].assert.description = "Confirm that the MessageHeader.response.identifier is equal to Id of original message "
* test[1].action[4].assert.direction = #request
* test[1].action[4].assert.expression = "Bundle.entry.resource.ofType(MessageHeader).response.identifier"
* test[1].action[4].assert.operator = #equals
* test[1].action[4].assert.value = "${bundleResourceid}"
* test[1].action[4].assert.warningOnly = false

* test[1].action[5].assert.description = "Confirm that the reference original Provenance.entity.what is equal to Id of original messageheader.identifier"
* test[1].action[5].assert.direction = #request
* test[1].action[5].assert.expression = "Bundle.entry.resource.ofType(Provenance).where(entity.what.reference ='${MessageHeaderIdentifier}')"
* test[1].action[5].assert.warningOnly = false


RuleSet: OperationOutcomeNot
* test[1].action[3].assert.description = "Confirm that the Bundle not containing a OperationOutcome"
* test[1].action[3].assert.direction = #request
* test[1].action[3].assert.expression = "Bundle.entry.resource.ofType(OperationOutcome).exists().not()"
* test[1].action[3].assert.warningOnly = false

RuleSet: OperationOutcome
* test[1].action[3].assert.description = "Confirm that the Bundle containing a OperationOutcome"
* test[1].action[3].assert.direction = #request
* test[1].action[3].assert.expression = "Bundle.entry.resource.ofType(OperationOutcome).exists()"
* test[1].action[3].assert.warningOnly = false