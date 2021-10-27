Instance: TestinstanceUFHV5
InstanceOf: TestScript


* insert Metadata
* id = "UFHV05"
* url = "http://build.fhir.org/ig/hl7dk/dk-medcom/"
* name = "receive-notification-admit and discharge to home"
* title = "Patient is admitted at hospital, goes on leave from hospital, returns after leave, and is finally discharged to home"
* description = "Testing correct use of admit and discharge"


* origin.index = 1
* origin.profile.system = "http://terminology.hl7.org/CodeSystem/testscript-profile-origin-types"
* origin.profile.code = #FHIR-Client

* destination.index = 1
* destination.profile.system = "http://terminology.hl7.org/CodeSystem/testscript-profile-destination-types"
* destination.profile.code = #FHIR-Server

* fixture[+].id = "bundle-create-STIN"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "/FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STIN-UF_H_V_10.xml"

* fixture[+].id = "bundle-create-STOR"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "/FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STOR-UF_H_V_10.xml"

* fixture[+].id = "bundle-create-SLOR"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "/FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-SLOR-UF_H_V_10.xml"

* fixture[+].id = "bundle-create-AN-SLHJ"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "/FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-SLHJ-UF_H_V_10.xml"

//Only one ACK each testscipt
* insert ACKFixture 

* profile.id = "hospitalnotification-profile"
* profile.reference = "http://medcomfhir.dk/fhir/core/1.0/StructureDefinition/medcom-hospitalNotification-message"  

* variable[+].name = "destinationUri"
* variable[=].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
* variable[=].sourceId = "bundle-create-STIN"

* variable[+].name = "destinationUriSTOR5"
* variable[=].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
* variable[=].sourceId = "bundle-create-STOR"

* variable[+].name = "destinationUriSLOR5"
* variable[=].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
* variable[=].sourceId = "bundle-create-SLOR"

* variable[+].name = "destinationUriSLHJ5"
* variable[=].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
* variable[=].sourceId = "bundle-create-AN-SLHJ"


//STIN
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

//STOR
* setup.action[+].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[=].operation.type.code = #delete
* setup.action[=].operation.resource = #Bundle
* setup.action[=].operation.description = "System-generated search and delete operations from conditional delete on Bundle MessageHeader).destination.endpoint"
* setup.action[=].operation.accept = #xml
* setup.action[=].operation.encodeRequestUrl = true
* setup.action[=].operation.params = "?message.destination-uri=${destinationUriSTOR5}"

* setup.action[+].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[=].operation.type.code = #create
* setup.action[=].operation.resource = #Bundle
* setup.action[=].operation.description = "Create the Bundle resource in XML format on the destination server."
* setup.action[=].operation.accept = #xml
* setup.action[=].operation.contentType = #xml
* setup.action[=].operation.encodeRequestUrl = true
* setup.action[=].operation.sourceId = "bundle-create-STOR"

* setup.action[+].assert.description = "Confirm that the returned HTTP status is 201(Created)."
* setup.action[=].assert.direction = #response
* setup.action[=].assert.responseCode = "201"
* setup.action[=].assert.warningOnly = false


//SLOR
* setup.action[+].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[=].operation.type.code = #delete
* setup.action[=].operation.resource = #Bundle
* setup.action[=].operation.description = "System-generated search and delete operations from conditional delete on Bundle MessageHeader).destination.endpoint"
* setup.action[=].operation.accept = #xml
* setup.action[=].operation.encodeRequestUrl = true
* setup.action[=].operation.params = "?message.destination-uri=${destinationUriSLOR5}"

* setup.action[+].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[=].operation.type.code = #create
* setup.action[=].operation.resource = #Bundle
* setup.action[=].operation.description = "Create the Bundle resource in XML format on the destination server."
* setup.action[=].operation.accept = #xml
* setup.action[=].operation.contentType = #xml
* setup.action[=].operation.encodeRequestUrl = true
* setup.action[=].operation.sourceId = "bundle-create-SLOR"

* setup.action[+].assert.description = "Confirm that the returned HTTP status is 201(Created)."
* setup.action[=].assert.direction = #response
* setup.action[=].assert.responseCode = "201"
* setup.action[=].assert.warningOnly = false

//SLHJ
* setup.action[+].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[=].operation.type.code = #delete
* setup.action[=].operation.resource = #Bundle
* setup.action[=].operation.description = "System-generated search and delete operations from conditional delete on Bundle MessageHeader).destination.endpoint"
* setup.action[=].operation.accept = #xml
* setup.action[=].operation.encodeRequestUrl = true
* setup.action[=].operation.params = "?message.destination-uri=${destinationUriSLHJ5}"

* setup.action[+].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[=].operation.type.code = #create
* setup.action[=].operation.resource = #Bundle
* setup.action[=].operation.description = "Create the Bundle resource in XML format on the destination server."
* setup.action[=].operation.accept = #xml
* setup.action[=].operation.contentType = #xml
* setup.action[=].operation.encodeRequestUrl = true
* setup.action[=].operation.sourceId = "bundle-create-AN-SLHJ"

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

* insert createAckTest(3, bundle-create-STIN, bundleResourceid, MessageHeaderIdentifier, ProvenanceID)

* test[+].id = "02-STOR"
* test[=].name = "HospitalNotification-STOR"
* test[=].description = "GET a Hospital notification. The expected response is a 200(OK) with a payload of the Hospital notification resource in XML format."
* test[=].action[+].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* test[=].action[=].operation.type.code = #read
* test[=].action[=].operation.resource = #Bundle
* test[=].action[=].operation.description = "The patient does not show up after ended leave -SLHJ"
* test[=].action[=].operation.accept = #xml
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.params = "?message.destination-uri=${destinationUriSTOR5}"
* test[=].action[+].assert.description = "Confirm that the returned HTTP status is 200(OK)."
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.responseCode = "200"
* test[=].action[=].assert.warningOnly = false

* insert createAckTest(3, bundle-create-STOR, bundleResourceid, MessageHeaderIdentifier, ProvenanceID)

* test[2].id = "03-SLOR"
* test[2].name = "HospitalNotification-SLOR"
* test[2].description = "GET a Hospital notification. The expected response is a 200(OK) with a payload of the Hospital notification resource in XML format."
* test[2].action[0].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* test[2].action[0].operation.type.code = #read
* test[2].action[0].operation.resource = #Bundle
* test[2].action[0].operation.description = "The patient does not show up after ended leave -SLHJ"
* test[2].action[0].operation.accept = #xml
* test[2].action[0].operation.destination = 1
* test[2].action[0].operation.encodeRequestUrl = true
* test[2].action[0].operation.origin = 1
* test[2].action[0].operation.params = "?message.destination-uri=${destinationUriSLOR5}"
* test[2].action[1].assert.description = "Confirm that the returned HTTP status is 200(OK)."
* test[2].action[1].assert.direction = #response
* test[2].action[1].assert.responseCode = "200"
* test[2].action[1].assert.warningOnly = false

* test[3].id = "04-SLHJ"
* test[3].name = "HospitalNotification-SLHJ"
* test[3].description = "GET a Hospital notification. The expected response is a 200(OK) with a payload of the Hospital notification resource in XML format."
* test[3].action[0].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* test[3].action[0].operation.type.code = #read
* test[3].action[0].operation.resource = #Bundle
* test[3].action[0].operation.description = "The patient does not show up after ended leave -SLHJ"
* test[3].action[0].operation.accept = #xml
* test[3].action[0].operation.destination = 1
* test[3].action[0].operation.encodeRequestUrl = true
* test[3].action[0].operation.origin = 1
* test[3].action[0].operation.params = "?message.destination-uri=${destinationUriSLHJ5}"
* test[3].action[1].assert.description = "Confirm that the returned HTTP status is 200(OK)."
* test[3].action[1].assert.direction = #response
* test[3].action[1].assert.responseCode = "200"
* test[3].action[1].assert.warningOnly = false
