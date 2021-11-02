Instance: TestinstanceUFHV1-with-ACK
InstanceOf: TestScript

* insert Metadata
* id = "UFHV01-with-ACK"
* name = "receive-notification-about-admission"
* title = "hospitalNotification-message admit-inpatient receiving XML"
* description = "Testing correct use of status admit-inpatient"

//Once per testscript
* insert ACKFixture 

//param: type, number fixture
* insert HospitalNotificationCreateTest(STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/HospitalNotificationMessage-STIN-K1.xml)

//param: type, number fixture
* insert HospitalNotificationCreateTest(SLHJ, 2, /FHIRSandbox/MedCom/401-Hospitalnotification/receive/Userstory/_reference/resources/HospitalNotificationMessage-SLHJ-K3.xml)
