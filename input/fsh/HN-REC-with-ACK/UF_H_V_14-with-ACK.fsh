//STIN+MORS
Instance: TestinstanceUFHV14-with-ACK
InstanceOf: TestScript


* insert Metadata
* id = "UFHV14-with-ACK"
* name = "Patient is admitted and dies at the hospital"
* title = "Patient is admitted and dies at the hospital"
* description = "Testing correct use of status admit-inpatient"

//Once per testscript
* insert ACKFixture 

//param: type, number fixture
* insert HospitalNotificationCreateTest(STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/STIN_9.xml)

//param: type, number fixture
* insert HospitalNotificationCreateTest(MORS, 2, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/MORS_2.xml)