Alias: $Fixture1Refference = /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/HospitalNotificationMessage-STIN-K1.xml
Alias: $Fixture1ID = bundle-create-STIN

Alias: $Fixture2Refference = /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/HospitalNotificationMessage-SLHJ-K3.xml
Alias: $Fixture2ID = bundle-create-SLHJ

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

* fixture[0].id = $Fixture1ID
* fixture[0].autocreate = false
* fixture[0].autodelete = false
* fixture[0].resource.reference = $Fixture1Refference

* fixture[1].id = $Fixture2ID
* fixture[1].autocreate = false
* fixture[1].autodelete = false
* fixture[1].resource.reference = $Fixture2Refference

* profile.id = "hospitalnotification-profile"
* profile.reference = "http://medcomfhir.dk/fhir/core/1.0/StructureDefinition/medcom-hospitalNotification-message"  

* variable[0].name = "destinationUri"
* variable[0].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
* variable[0].sourceId = $Fixture1ID

* variable[1].name = "destinationUriK3"
* variable[1].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
* variable[1].sourceId = $Fixture2ID

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
* setup.action[1].operation.sourceId = $Fixture1ID

* setup.action[2].assert.description = "Confirm that the returned HTTP status is 201(Created)."
* setup.action[2].assert.direction = #response
* setup.action[2].assert.responseCode = "201"
* setup.action[2].assert.warningOnly = false

* setup.action[3].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[3].operation.type.code = #delete
* setup.action[3].operation.resource = #Bundle
* setup.action[3].operation.description = "System-generated search and delete operations from conditional delete on Bundle MessageHeader).destination.endpoint"
* setup.action[3].operation.accept = #xml
* setup.action[3].operation.encodeRequestUrl = true
* setup.action[3].operation.params = "?message.destination-uri=${destinationUriK3}"

* setup.action[4].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[4].operation.type.code = #create
* setup.action[4].operation.resource = #Bundle
* setup.action[4].operation.description = "Create the Bundle resource in XML format on the destination server."
* setup.action[4].operation.accept = #xml
* setup.action[4].operation.contentType = #xml
* setup.action[4].operation.encodeRequestUrl = true
* setup.action[4].operation.sourceId = $Fixture2ID

* setup.action[5].assert.description = "Confirm that the returned HTTP status is 201(Created)."
* setup.action[5].assert.direction = #response
* setup.action[5].assert.responseCode = "201"
* setup.action[5].assert.warningOnly = false

* test[0].id = "01-STIN-admitted"
* test[0].name = "HospitalNotification-STIN"
* test[0].description = "GET a Hospital notification. The expected response is a 200(OK) with a payload of the Hospital notification resource in XML format."
* test[0].action[0].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* test[0].action[0].operation.type.code = #read
* test[0].action[0].operation.resource = #Bundle
* test[0].action[0].operation.description = "Receive notification about admission -STIN"
* test[0].action[0].operation.accept = #xml
* test[0].action[0].operation.destination = 1
* test[0].action[0].operation.encodeRequestUrl = true
* test[0].action[0].operation.origin = 1
* test[0].action[0].operation.params = "?message.destination-uri=${destinationUri}"
* test[0].action[1].assert.description = "Confirm that the returned HTTP status is 200(OK)."
* test[0].action[1].assert.direction = #response
* test[0].action[1].assert.responseCode = "200"
* test[0].action[1].assert.warningOnly = false

* test[1].id = "02-SLHJ-end-leave"
* test[1].name = "HospitalNotification-SLHJ"
* test[1].description = "GET a Hospital notification. The expected response is a 200(OK) with a payload of the Hospital notification resource in XML format."
* test[1].action[0].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* test[1].action[0].operation.type.code = #read
* test[1].action[0].operation.resource = #Bundle
* test[1].action[0].operation.description = "The patient does not show up after ended leave -SLHJ"
* test[1].action[0].operation.accept = #xml
* test[1].action[0].operation.destination = 1
* test[1].action[0].operation.encodeRequestUrl = true
* test[1].action[0].operation.origin = 1
* test[1].action[0].operation.params = "?message.destination-uri=${destinationUriK3}"
* test[1].action[1].assert.description = "Confirm that the returned HTTP status is 200(OK)."
* test[1].action[1].assert.direction = #response
* test[1].action[1].assert.responseCode = "200"
* test[1].action[1].assert.warningOnly = false
