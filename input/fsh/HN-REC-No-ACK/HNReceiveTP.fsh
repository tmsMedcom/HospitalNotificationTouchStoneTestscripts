RuleSet: HnRecGeneralTmp(id)
* id = "{id}"
* insert Metadata
* name = "re111ceive-notification-about-admission"
* title = "111hospitalNotification-message admit-inpatient receiving XML"
* status = #active
* date = 2021-06-25
* publisher = "MedCom"
* contact.name = "MedCom"
* contact.telecom.system = #email
* contact.telecom.value = "fhir@medcom.dk"
* contact.telecom.use = #work
* description = "Testing correct use of status admit-inpatient"
* copyright = "MedCom 2021"

* origin.index = 1
* origin.profile.system = "http://terminology.hl7.org/CodeSystem/testscript-profile-origin-types"
* origin.profile.code = #FHIR-Client


* destination.index = 1
* destination.profile.system = "http://terminology.hl7.org/CodeSystem/testscript-profile-destination-types"
* destination.profile.code = #FHIR-Server

* profile.id = "hospitalnotification-profile"
* profile.reference = "http://medcomfhir.dk/fhir/core/1.0/StructureDefinition/medcom-hospitalNotification-message" 

* profile.id = "acknowledgment-profile"
* profile.reference = "http://medcomfhir.dk/fhir/core/1.0/StructureDefinition/medcom-messaging-acknowledgement"

//generelt above



//N = count up n+1

RuleSet: HnRecSpeceficTmp(hnFixId, hnResourceRef,NOfACK, ACKResourceRef)
//HN fixture and Variable
* fixture[+].id = "{hnFixId}"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "{hnResourceRef}"

* variable[+].name = "destinationUri{hnFixId}"
* variable[=].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
* variable[=].sourceId = "{hnFixId}"

* variable[+].name = "bundleResourceid{hnFixId}"
* variable[=].expression = "Bundle.id"
* variable[=].sourceId = "{hnFixId}"

* variable[+].name = "MessageHeaderIdentifier"
* variable[=].expression = "Bundle.entry[0].fullUrl"
* variable[=].sourceId = "{hnFixId}"

//ACK fixture and Variable
* fixture[+].id = "bundle-create-ack-ok-{NOfACK}"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "{ACKResourceRef}"

* variable[+].name = "headerResourceReference"
* variable[=].expression = "Bundle.entry[0].fullUrl"
* variable[=].sourceId = "bundle-create-ack-ok-{NOfACK}"


* setup.action[+].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[=].operation.type.code = #delete
* setup.action[=].operation.resource = #Bundle
* setup.action[=].operation.description = "System-generated search and delete operations from conditional delete on Bundle MessageHeader).destination.endpoint"
* setup.action[=].operation.accept = #xml
* setup.action[=].operation.encodeRequestUrl = true
* setup.action[=].operation.params = "?message.destination-uri=${destinationUri{hnFixId}}"

* setup.action[+].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[=].operation.type.code = #create
* setup.action[=].operation.resource = #Bundle
* setup.action[=].operation.description = "Create the Bundle resource in XML format on the destination server."
* setup.action[=].operation.accept = #xml
* setup.action[=].operation.contentType = #xml
* setup.action[=].operation.encodeRequestUrl = true
* setup.action[=].operation.sourceId = "{hnFixId}"

* setup.action[+].assert.description = "Confirm that the returned HTTP status is 201(Created)."
* setup.action[=].assert.direction = #response
* setup.action[=].assert.responseCode = "201"
* setup.action[=].assert.warningOnly = false

* test[+].id = "01-{hnFixId}"
* test[=].name = "HospitalNotification-STIN"
* test[=].description = "GET a Hospital notification. The expected response is a 200(OK) with a payload of the Hospital notification resource in XML format."
* test[=].action[+].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* test[=].action[=].operation.type.code = #read
* test[=].action[=].operation.resource = #Bundle
* test[=].action[=].operation.description = "Receive notification about admission -STIN"
* test[=].action[=].operation.accept = #xml
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.params = "?message.destination-uri=${destinationUri{hnFixId}}"
* test[=].action[+].assert.description = "Confirm that the returned HTTP status is 200(OK)."
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.responseCode = "200"
* test[=].action[=].assert.warningOnly = false


* test[+].id = "02-ACK-01-ok{hnFixId}"
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
* test[=].action[=].operation.sourceId = "bundle-create-ack-ok-{NOfACK}"

* test[=].action[+].assert.description = "Confirm that the client request payload contains a Bundle resource type."
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.resource = #Bundle
* test[=].action[=].assert.warningOnly = false

* test[=].action[+].assert.description = "Confirm that the MessageHeader response code is ok"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(MessageHeader).response.code"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "ok"
* test[=].action[=].assert.warningOnly = false

* test[=].action[3].assert.description = "Confirm that the Bundle not containing a OperationOutcome"
* test[=].action[3].assert.direction = #request
* test[=].action[3].assert.expression = "Bundle.entry.resource.ofType(OperationOutcome).exists().not()"
* test[=].action[3].assert.warningOnly = false

* test[=].action[+].assert.description = "Confirm that the MessageHeader.response.identifier is equal to Id of original message "
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(MessageHeader).response.identifier"
* test[=].action[=].assert.operator = #equals
* test[=].action[=].assert.value = "${bundleResourceid{hnFixId}}"
* test[=].action[=].assert.warningOnly = false

* test[=].action[+].assert.description = "Confirm that the reference  Provenance.entity.what is equal to Id of original messageheader.identifier"
* test[=].action[=].assert.direction = #request
* test[=].action[=].assert.expression = "Bundle.entry.resource.ofType(Provenance).where(entity.what.reference ='${MessageHeaderIdentifier}')"
* test[=].action[=].assert.warningOnly = false



