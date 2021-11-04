//STIN
Instance: TestinstanceUFHV16-with-ACK
InstanceOf: TestScript

* insert Metadata
* id = "UFHV16-with-ACK"
* name = "transferred to a private hospital"
* title = "Patient is admitted, transferred to a private hospital (or other department) not sending notifications, and finally discharged"
* description = "Testing correct use of correction"

//Once per testscript
* insert ACKFixture 

//param: type, number fixture
* insert HospitalNotificationCreateTest(STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/STIN_16.xml)