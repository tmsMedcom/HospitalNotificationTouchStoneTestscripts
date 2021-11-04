//STIN+STOR+SLOR+SLHJ
Alias: $Fixture5STINRefference = /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STIN-UF_H_V_10.xml
Alias: $Fixture5STIN = bundle-create-STIN

Alias: $Fixture5STORRefference = /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STOR-UF_H_V_10.xml
Alias: $Fixture5STORID = bundle-create-STOR

Alias: $Fixture5SLORRefference = /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-SLOR-UF_H_V_10.xml
Alias: $Fixture5SLORID = bundle-create-SLOR

Alias: $Fixture5SLHJRefference = /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-SLHJ-UF_H_V_10.xml
Alias: $Fixture5SLHJID = bundle-create-AN-SLHJ

Instance: TestinstanceUFHV5
InstanceOf: TestScript



* id = "UFHV05"
* meta.profile = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript"
* url = "http://build.fhir.org/ig/hl7dk/dk-medcom/"
* name = "receive-notification-admit and discharge to home"
* title = "Patient is admitted at hospital, goes on leave from hospital, returns after leave, and is finally discharged to home"
* status = #active
* date = 2021-06-30
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

* fixture[0].id = $Fixture5STIN
* fixture[0].autocreate = false
* fixture[0].autodelete = false
* fixture[0].resource.reference = $Fixture5STINRefference

* fixture[1].id = $Fixture5STORID
* fixture[1].autocreate = false
* fixture[1].autodelete = false
* fixture[1].resource.reference = $Fixture5STORRefference

* fixture[2].id = $Fixture5SLORID
* fixture[2].autocreate = false
* fixture[2].autodelete = false
* fixture[2].resource.reference = $Fixture5SLORRefference

* fixture[3].id = $Fixture5SLHJID
* fixture[3].autocreate = false
* fixture[3].autodelete = false
* fixture[3].resource.reference = $Fixture5SLHJRefference

* profile.id = "hospitalnotification-profile"
* profile.reference = "http://medcomfhir.dk/fhir/core/1.0/StructureDefinition/medcom-hospitalNotification-message"  

* variable[0].name = "destinationUri"
* variable[0].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
* variable[0].sourceId = $Fixture5STIN

* variable[1].name = "destinationUriSTOR5"
* variable[1].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
* variable[1].sourceId = $Fixture5STORID

* variable[2].name = "destinationUriSLOR5"
* variable[2].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
* variable[2].sourceId = $Fixture5SLORID

* variable[3].name = "destinationUriSLHJ5"
* variable[3].expression = "Bundle.entry.resource.ofType(MessageHeader).destination.endpoint"
* variable[3].sourceId = $Fixture5SLHJID


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
* setup.action[1].operation.sourceId = $Fixture5STIN

* setup.action[2].assert.description = "Confirm that the returned HTTP status is 201(Created)."
* setup.action[2].assert.direction = #response
* setup.action[2].assert.responseCode = "201"
* setup.action[2].assert.warningOnly = false

//STOR
* setup.action[3].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[3].operation.type.code = #delete
* setup.action[3].operation.resource = #Bundle
* setup.action[3].operation.description = "System-generated search and delete operations from conditional delete on Bundle MessageHeader).destination.endpoint"
* setup.action[3].operation.accept = #xml
* setup.action[3].operation.encodeRequestUrl = true
* setup.action[3].operation.params = "?message.destination-uri=${destinationUriSTOR5}"

* setup.action[4].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[4].operation.type.code = #create
* setup.action[4].operation.resource = #Bundle
* setup.action[4].operation.description = "Create the Bundle resource in XML format on the destination server."
* setup.action[4].operation.accept = #xml
* setup.action[4].operation.contentType = #xml
* setup.action[4].operation.encodeRequestUrl = true
* setup.action[4].operation.sourceId = $Fixture5STORID

* setup.action[5].assert.description = "Confirm that the returned HTTP status is 201(Created)."
* setup.action[5].assert.direction = #response
* setup.action[5].assert.responseCode = "201"
* setup.action[5].assert.warningOnly = false


//SLOR
* setup.action[6].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[6].operation.type.code = #delete
* setup.action[6].operation.resource = #Bundle
* setup.action[6].operation.description = "System-generated search and delete operations from conditional delete on Bundle MessageHeader).destination.endpoint"
* setup.action[6].operation.accept = #xml
* setup.action[6].operation.encodeRequestUrl = true
* setup.action[6].operation.params = "?message.destination-uri=${destinationUriSLOR5}"

* setup.action[7].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[7].operation.type.code = #create
* setup.action[7].operation.resource = #Bundle
* setup.action[7].operation.description = "Create the Bundle resource in XML format on the destination server."
* setup.action[7].operation.accept = #xml
* setup.action[7].operation.contentType = #xml
* setup.action[7].operation.encodeRequestUrl = true
* setup.action[7].operation.sourceId = $Fixture5SLORID

* setup.action[8].assert.description = "Confirm that the returned HTTP status is 201(Created)."
* setup.action[8].assert.direction = #response
* setup.action[8].assert.responseCode = "201"
* setup.action[8].assert.warningOnly = false

//SLHJ
* setup.action[9].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[9].operation.type.code = #delete
* setup.action[9].operation.resource = #Bundle
* setup.action[9].operation.description = "System-generated search and delete operations from conditional delete on Bundle MessageHeader).destination.endpoint"
* setup.action[9].operation.accept = #xml
* setup.action[9].operation.encodeRequestUrl = true
* setup.action[9].operation.params = "?message.destination-uri=${destinationUriSLHJ5}"

* setup.action[10].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* setup.action[10].operation.type.code = #create
* setup.action[10].operation.resource = #Bundle
* setup.action[10].operation.description = "Create the Bundle resource in XML format on the destination server."
* setup.action[10].operation.accept = #xml
* setup.action[10].operation.contentType = #xml
* setup.action[10].operation.encodeRequestUrl = true
* setup.action[10].operation.sourceId = $Fixture5SLHJID

* setup.action[11].assert.description = "Confirm that the returned HTTP status is 201(Created)."
* setup.action[11].assert.direction = #response
* setup.action[11].assert.responseCode = "201"
* setup.action[11].assert.warningOnly = false


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

* test[1].id = "02-STOR"
* test[1].name = "HospitalNotification-STOR"
* test[1].description = "GET a Hospital notification. The expected response is a 200(OK) with a payload of the Hospital notification resource in XML format."
* test[1].action[0].operation.type.system = "http://terminology.hl7.org/CodeSystem/testscript-operation-codes"
* test[1].action[0].operation.type.code = #read
* test[1].action[0].operation.resource = #Bundle
* test[1].action[0].operation.description = "The patient does not show up after ended leave -SLHJ"
* test[1].action[0].operation.accept = #xml
* test[1].action[0].operation.destination = 1
* test[1].action[0].operation.encodeRequestUrl = true
* test[1].action[0].operation.origin = 1
* test[1].action[0].operation.params = "?message.destination-uri=${destinationUriSTOR5}"
* test[1].action[1].assert.description = "Confirm that the returned HTTP status is 200(OK)."
* test[1].action[1].assert.direction = #response
* test[1].action[1].assert.responseCode = "200"
* test[1].action[1].assert.warningOnly = false

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
