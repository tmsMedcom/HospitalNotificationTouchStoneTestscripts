Instance: TestinstanceUFHV1
InstanceOf: TestScript
* id = "UFHV01"
* meta.profile = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript"
* url = "http://build.fhir.org/ig/hl7dk/dk-medcom/"
* name = "receive-notification-about-admission"
* title = "hospitalNotification-message admit-inpatient receiving XML"
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

* fixture[+].id = "bundle-create-STIN"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "/FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/HospitalNotificationMessage-STIN-K1.xml"

//SKAL MED I TBD fælles
* fixture[1].id = "bundle-create-ack-OK"
* fixture[1].autocreate = false
* fixture[1].autodelete = false
* fixture[1].resource.reference = "/FHIRSandbox/MedCom/401-Acknowledgement/_reference/resources/Acknowledgement-ok.xml"

* insert ACKRuleAddOn("bundle-create-STIN",STIN)
* insert ACKRuleAddOn("bundle-create-SLHJ", SLHJ)

* fixture[+].id = "bundle-create-SLHJ"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "/FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/HospitalNotificationMessage-SLHJ-K3.xml"

* profile.id = "hospitalnotification-profile"
* profile.reference = "http://medcomfhir.dk/fhir/core/1.0/StructureDefinition/medcom-hospitalNotification-message"  

//SKAL MED I TBD fælles
* profile.id = "acknowledgment-profile"
* profile.reference = "http://medcomfhir.dk/fhir/core/1.0/StructureDefinition/medcom-messaging-acknowledgement"

//TEST1 HN
* variable[+].name = "destinationUri"
* variable[=].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
* variable[=].sourceId = "bundle-create-STIN"

// test1 ack - SKAL MED I TBD indvi
* variable[2].name = "bundleResourceid"
* variable[2].expression = "Bundle.id"
* variable[2].sourceId = "bundle-create-STIN"
// test1 ack - SKAL MED I TBD indvi
* variable[3].name = "MessageHeaderIdentifier"
* variable[3].expression = "Bundle.entry[0].fullUrl"
* variable[3].sourceId = "bundle-create-STIN"

//Test2 HN
* variable[+].name = "destinationUriK3"
* variable[=].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
* variable[=].sourceId = "bundle-create-SLHJ"

// test2 ack - SKAL MED I TBD indvi
* variable[2].name = "bundleResourceid2"
* variable[2].expression = "Bundle.id"
* variable[2].sourceId = "bundle-create-SLHJ"
// test2 ack - SKAL MED I TBD indvi
* variable[3].name = "MessageHeaderIdentifier2"
* variable[3].expression = "Bundle.entry[0].fullUrl"
* variable[3].sourceId = "bundle-create-SLHJ"


* setup.action[+].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[=].operation.type.code = #delete
* setup.action[=].operation.resource = #Bundle
* setup.action[=].operation.description = "System-generated search and delete operations from conditional delete on Bundle MessageHeader).destination.endpoint"
* setup.action[=].operation.accept = #xml
* setup.action[=].operation.encodeRequestUrl = true
* setup.action[=].operation.params = "?message.destination-uri=${destinationUri}"

* setup.action[+].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
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

* setup.action[+].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[=].operation.type.code = #delete
* setup.action[=].operation.resource = #Bundle
* setup.action[=].operation.description = "System-generated search and delete operations from conditional delete on Bundle MessageHeader).destination.endpoint"
* setup.action[=].operation.accept = #xml
* setup.action[=].operation.encodeRequestUrl = true
* setup.action[=].operation.params = "?message.destination-uri=${destinationUriK3}"

* setup.action[+].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[=].operation.type.code = #create
* setup.action[=].operation.resource = #Bundle
* setup.action[=].operation.description = "Create the Bundle resource in XML format on the destination server."
* setup.action[=].operation.accept = #xml
* setup.action[=].operation.contentType = #xml
* setup.action[=].operation.encodeRequestUrl = true
* setup.action[=].operation.sourceId = "bundle-create-SLHJ"

* setup.action[+].assert.description = "Confirm that the returned HTTP status is 201(Created)."
* setup.action[=].assert.direction = #response
* setup.action[=].assert.responseCode = "201"
* setup.action[=].assert.warningOnly = false

* test[+].id = "01-STIN-admitted"
* test[=].name = "HospitalNotification-STIN"
* test[=].description = "GET a Hospital notification. The expected response is a 200(OK) with a payload of the Hospital notification resource in XML format."
* test[=].action[0].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* test[=].action[0].operation.type.code = #read
* test[=].action[0].operation.resource = #Bundle
* test[=].action[0].operation.description = "Receive notification about admission -STIN"
* test[=].action[0].operation.accept = #xml
* test[=].action[0].operation.destination = 1
* test[=].action[0].operation.encodeRequestUrl = true
* test[=].action[0].operation.origin = 1
* test[=].action[0].operation.params = "?message.destination-uri=${destinationUri}"
* test[=].action[1].assert.description = "Confirm that the returned HTTP status is 200(OK)."
* test[=].action[1].assert.direction = #response
* test[=].action[1].assert.responseCode = "200"
* test[=].action[1].assert.warningOnly = false

//ACk1 SKal med TBD indv
* test[1].id = "02-ACK-01-STIN"
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
* test[1].action[0].operation.sourceId = "bundle-create-ack-OK"

* test[1].action[1].assert.description = "Confirm that the client request payload contains a Bundle resource type."
* test[1].action[1].assert.direction = #request
* test[1].action[1].assert.resource = #Bundle
* test[1].action[1].assert.warningOnly = false

* test[1].action[2].assert.description = "Confirm that the MessageHeader response code is OK"
* test[1].action[2].assert.direction = #request
* test[1].action[2].assert.expression = "Bundle.entry.resource.ofType(MessageHeader).response.code"
* test[1].action[2].assert.operator = #equals
* test[1].action[2].assert.value = "OK"
* test[1].action[2].assert.warningOnly = false

* insert OperationOutcomeNot

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





* test[+].id = "02-SLHJ-end-leave"
* test[=].name = "HospitalNotification-SLHJ"
* test[=].description = "GET a Hospital notification. The expected response is a 200(OK) with a payload of the Hospital notification resource in XML format."
* test[=].action[0].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* test[=].action[0].operation.type.code = #read
* test[=].action[0].operation.resource = #Bundle
* test[=].action[0].operation.description = "The patient does not show up after ended leave -SLHJ"
* test[=].action[0].operation.accept = #xml
* test[=].action[0].operation.destination = 1
* test[=].action[0].operation.encodeRequestUrl = true
* test[=].action[0].operation.origin = 1
* test[=].action[0].operation.params = "?message.destination-uri=${destinationUriK3}"
* test[=].action[1].assert.description = "Confirm that the returned HTTP status is 200(OK)."
* test[=].action[1].assert.direction = #response
* test[=].action[1].assert.responseCode = "200"
* test[=].action[1].assert.warningOnly = false

