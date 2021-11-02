Instance: TestinstanceUFHV4-with-ACK
InstanceOf: TestScript


* insert Metadata
* id = "UFHV04-with-ACK"
* meta.profile = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript"
* url = "http://build.fhir.org/ig/hl7dk/dk-medcom/"
* name = "receive-notification-admitted and discharged"
* title = "Patient is admitted at hospital and a day after discharged (emergency)"
//Once per testscript
* insert ACKFixture 

//param: type, number fixture
* insert HospitalNotificationCreateTest(STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/STIN_14.xml)
//param: type, number fixture
* insert HospitalNotificationCreateTest(SLHJ, 2, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/SLHJ_UFHV4.xml)
