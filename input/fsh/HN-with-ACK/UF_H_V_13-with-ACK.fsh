//MORS

Instance: TestinstanceUFHV13-with-ACK
InstanceOf: TestScript


* insert Metadata
* id = "UFHV13-with-ACK"
* name = "Patient dies upon arrival at the hospital"
* title = "Patient dies upon arrival at the hospital"
* description = "Testing correct use of correction"

* origin.index = 1
* origin.profile.system = "http://terminology.hl7.org/CodeSystem/testscript-profile-origin-types"
* origin.profile.code = #FHIR-Client

* destination.index = 1
* destination.profile.system = "http://terminology.hl7.org/CodeSystem/testscript-profile-destination-types"
* destination.profile.code = #FHIR-Server

* fixture[+].id = "bundle-create-MORS"
* fixture[=].autocreate = false
* fixture[=].autodelete = false
* fixture[=].resource.reference = "/FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/MORS_1.xml"

//Only one ACK each testscipt
* insert ACKFixture 

* profile.id = "hospitalnotification-profile"
* profile.reference = "http://medcomfhir.dk/fhir/core/1.0/StructureDefinition/medcom-hospitalNotification-message"  

* variable[+].name = "destinationUri"
* variable[=].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
* variable[=].sourceId = "bundle-create-MORS"

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
* setup.action[=].operation.sourceId = "bundle-create-MORS"

* setup.action[+].assert.description = "Confirm that the returned HTTP status is 201(Created)."
* setup.action[=].assert.direction = #response
* setup.action[=].assert.responseCode = "201"
* setup.action[=].assert.warningOnly = false

* test[+].id = "01-MORS-arrival"
* test[=].name = "HospitalNotification-MORS"
* test[=].description = "GET a Hospital notification. The expected response is a 200(OK) with a payload of the Hospital notification resource in XML format."
* test[=].action[+].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* test[=].action[=].operation.type.code = #read
* test[=].action[=].operation.resource = #Bundle
* test[=].action[=].operation.description = "Patient dies upon arrival at the hospital"
* test[=].action[=].operation.accept = #xml
* test[=].action[=].operation.destination = 1
* test[=].action[=].operation.encodeRequestUrl = true
* test[=].action[=].operation.origin = 1
* test[=].action[=].operation.params = "?message.destination-uri=${destinationUri}"
* test[=].action[+].assert.description = "Confirm that the returned HTTP status is 200(OK)."
* test[=].action[=].assert.direction = #response
* test[=].action[=].assert.responseCode = "200"
* test[=].action[=].assert.warningOnly = false

* insert createAckTest(3, bundle-create-MORS, bundleResourceid, MessageHeaderIdentifier, ProvenanceID)