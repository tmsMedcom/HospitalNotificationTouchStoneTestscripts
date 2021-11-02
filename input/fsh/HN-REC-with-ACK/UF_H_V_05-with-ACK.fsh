Instance: TestinstanceUFHV5-with-ACK
InstanceOf: TestScript


* insert Metadata
* id = "UFHV05-with-ACK"
* name = "receive-notification-admit and discharge to home"
* title = "Patient is admitted at hospital, goes on leave from hospital, returns after leave, and is finally discharged to home"
* description = "Testing correct use of admit and discharge"

//Once per testscript
* insert ACKFixture 

//param: type, number fixture
* insert HospitalNotificationCreateTest(STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STIN-UF_H_V_10.xml)
//param: type, number fixture
* insert HospitalNotificationCreateTest(STOR, 2, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STOR-UF_H_V_10.xml)
//param: type, number fixture
* insert HospitalNotificationCreateTest(SLOR, 3, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-SLOR-UF_H_V_10.xml)
//param: type, number fixture
* insert HospitalNotificationCreateTest(SLHJ, 4, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-SLHJ-UF_H_V_10.xml)
