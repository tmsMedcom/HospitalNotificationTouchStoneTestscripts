//MORS

Instance: TestinstanceUFHV13-with-ACK
InstanceOf: TestScript


* insert Metadata
* id = "UFHV13-with-ACK"
* name = "Patient dies upon arrival at the hospital"
* title = "Patient dies upon arrival at the hospital"
* description = "Testing correct use of correction"

//Once per testscript
* insert ACKFixture 

//param: type, number fixture
* insert HospitalNotificationCreateTest(MORS, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/MORS_1.xml)