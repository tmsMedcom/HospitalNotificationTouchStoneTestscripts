Instance: TestinstanceUFHV3-with-ACK
InstanceOf: TestScript

* insert Metadata
* id = "UFHV03-with-ACK"
* meta.profile = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript"
* url = "http://build.fhir.org/ig/hl7dk/dk-medcom/"
* name = "receive-notification-Cancellation"
* title = "Cancellation: Wrong patient has been admitted"

//Once per testscript
* insert ACKFixture 

//param: type, number fixture
* insert HospitalNotificationCreateTest(STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/STIN_12.xml)

//param: type, number fixture
* insert HospitalNotificationCreateTest(AN-STIN, 2, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/AN_STIN_12.xml)
