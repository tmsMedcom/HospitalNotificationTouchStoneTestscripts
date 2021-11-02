
Instance: TestinstanceUFHV2-with-ACK
InstanceOf: TestScript


* insert Metadata
* id = "UFHV02-with-ACK"
* meta.profile = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript"
* url = "http://build.fhir.org/ig/hl7dk/dk-medcom/"
* name = "receive-notification-correction"
* title = "Correction: Patient is admitted but the hospital department registered is incorrect "

//Once per testscript
* insert ACKFixture 

//param: type, number fixture
* insert HospitalNotificationCreateTest(STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/STIN_14.xml)
//param: type, number fixture
* insert HospitalNotificationCreateTest(RE-STIN, 2, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/RE_STIN_14.xml)