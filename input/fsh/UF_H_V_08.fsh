//STIN+STIN+SLHJ
Alias: $Fixture8STINRefference = /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STIN-UF_H_V_15.xml
Alias: $Fixture8STIN = bundle-create-STIN

Alias: $$Fixture8STIN2Refference = /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STIN2-UF_H_V_15.xml
Alias: $Fixture8STIN2ID = bundle-create-STIN2

Alias: $Fixture8SLHJRefference = /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-SLHJ-UF_H_V_15.xml
Alias: $Fixture8SLHJID = bundle-create-AN-SLHJ

Instance: TestinstanceUFHV8
InstanceOf: TestScript



* id = "UFHV08"
* meta.profile = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript"
* url = "http://build.fhir.org/ig/hl7dk/dk-medcom/"
* name = "Admitted, transferred and discharged to home"
* title = "Patient is admitted at hospital, transferred to another hospital (same region), and finally discharged to home"
* status = #active
* date = 2021-07-05
* publisher = "MedCom"
* contact.name = "MedCom"
* contact.telecom.system = #email
* contact.telecom.value = "fhir@medcom.dk"
* contact.telecom.use = #work
* description = "Testing correct use of admit and discharge"
* copyright = "MedCom 2021"

* origin.index = 1
* origin.profile.system = "http://terminology.hl7.org/CodeSystem/testscript-profile-origin-types"
* origin.profile.code = #FHIR-Client

* destination.index = 1
* destination.profile.system = "http://terminology.hl7.org/CodeSystem/testscript-profile-destination-types"
* destination.profile.code = #FHIR-Server

* fixture[0].id = $Fixture8STIN
* fixture[0].autocreate = false
* fixture[0].autodelete = false
* fixture[0].resource.reference = $Fixture8STINRefference

* fixture[1].id = $Fixture8STIN2ID
* fixture[1].autocreate = false
* fixture[1].autodelete = false
* fixture[1].resource.reference = $$Fixture8STIN2Refference

* fixture[2].id = $Fixture8SLHJID
* fixture[2].autocreate = false
* fixture[2].autodelete = false
* fixture[2].resource.reference = $Fixture8SLHJRefference

* profile.id = "hospitalnotification-profile"
* profile.reference = "http://medcomfhir.dk/fhir/core/1.0/StructureDefinition/medcom-hospitalNotification-message"  

* variable[0].name = "destinationUri"
* variable[0].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
* variable[0].sourceId = $Fixture8STIN

* variable[1].name = "destinationUriSTIN2"
* variable[1].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
* variable[1].sourceId = $Fixture8STIN2ID

* variable[2].name = "destinationUriSLHJ8"
* variable[2].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
* variable[2].sourceId = $Fixture8SLHJID


//STIN
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
* setup.action[1].operation.sourceId = $Fixture8STIN

* setup.action[2].assert.description = "Confirm that the returned HTTP status is 201(Created)."
* setup.action[2].assert.direction = #response
* setup.action[2].assert.responseCode = "201"
* setup.action[2].assert.warningOnly = false

//STIN
* setup.action[3].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[3].operation.type.code = #delete
* setup.action[3].operation.resource = #Bundle
* setup.action[3].operation.description = "System-generated search and delete operations from conditional delete on Bundle MessageHeader).destination.endpoint"
* setup.action[3].operation.accept = #xml
* setup.action[3].operation.encodeRequestUrl = true
* setup.action[3].operation.params = "?message.destination-uri=${destinationUriSTIN2}"

* setup.action[4].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[4].operation.type.code = #create
* setup.action[4].operation.resource = #Bundle
* setup.action[4].operation.description = "Create the Bundle resource in XML format on the destination server."
* setup.action[4].operation.accept = #xml
* setup.action[4].operation.contentType = #xml
* setup.action[4].operation.encodeRequestUrl = true
* setup.action[4].operation.sourceId = $Fixture8STIN2ID

* setup.action[5].assert.description = "Confirm that the returned HTTP status is 201(Created)."
* setup.action[5].assert.direction = #response
* setup.action[5].assert.responseCode = "201"
* setup.action[5].assert.warningOnly = false

* setup.action[6].assert.description = "Confirm that the returned HTTP status is 201(Created)."
* setup.action[6].assert.direction = #response
* setup.action[6].assert.responseCode = "201"
* setup.action[6].assert.warningOnly = false

//SLHJ
* setup.action[7].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[7].operation.type.code = #delete
* setup.action[7].operation.resource = #Bundle
* setup.action[7].operation.description = "System-generated search and delete operations from conditional delete on Bundle MessageHeader).destination.endpoint"
* setup.action[7].operation.accept = #xml
* setup.action[7].operation.encodeRequestUrl = true
* setup.action[7].operation.params = "?message.destination-uri=${destinationUriSLHJ8}"

* setup.action[8].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[8].operation.type.code = #create
* setup.action[8].operation.resource = #Bundle
* setup.action[8].operation.description = "Create the Bundle resource in XML format on the destination server."
* setup.action[8].operation.accept = #xml
* setup.action[8].operation.contentType = #xml
* setup.action[8].operation.encodeRequestUrl = true
* setup.action[8].operation.sourceId = $Fixture8SLHJID

* setup.action[9].assert.description = "Confirm that the returned HTTP status is 201(Created)."
* setup.action[9].assert.direction = #response
* setup.action[9].assert.responseCode = "201"
* setup.action[9].assert.warningOnly = false


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

* test[1].id = "02-STIN"
* test[1].name = "HospitalNotification-STIN2"
* test[1].description = "GET a Hospital notification. The expected response is a 200(OK) with a payload of the Hospital notification resource in XML format."
* test[1].action[0].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* test[1].action[0].operation.type.code = #read
* test[1].action[0].operation.resource = #Bundle
* test[1].action[0].operation.description = "The patient does not show up after ended leave -SLHJ"
* test[1].action[0].operation.accept = #xml
* test[1].action[0].operation.destination = 1
* test[1].action[0].operation.encodeRequestUrl = true
* test[1].action[0].operation.origin = 1
* test[1].action[0].operation.params = "?message.destination-uri=${destinationUriSTIN2}"
* test[1].action[1].assert.description = "Confirm that the returned HTTP status is 200(OK)."
* test[1].action[1].assert.direction = #response
* test[1].action[1].assert.responseCode = "200"
* test[1].action[1].assert.warningOnly = false

* test[2].id = "04-SLHJ"
* test[2].name = "HospitalNotification-SLHJ"
* test[2].description = "GET a Hospital notification. The expected response is a 200(OK) with a payload of the Hospital notification resource in XML format."
* test[2].action[0].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* test[2].action[0].operation.type.code = #read
* test[2].action[0].operation.resource = #Bundle
* test[2].action[0].operation.description = "The patient does not show up after ended leave -SLHJ"
* test[2].action[0].operation.accept = #xml
* test[2].action[0].operation.destination = 1
* test[2].action[0].operation.encodeRequestUrl = true
* test[2].action[0].operation.origin = 1
* test[2].action[0].operation.params = "?message.destination-uri=${destinationUriSLHJ8}"
* test[2].action[1].assert.description = "Confirm that the returned HTTP status is 200(OK)."
* test[2].action[1].assert.direction = #response
* test[2].action[1].assert.responseCode = "200"
* test[2].action[1].assert.warningOnly = false
