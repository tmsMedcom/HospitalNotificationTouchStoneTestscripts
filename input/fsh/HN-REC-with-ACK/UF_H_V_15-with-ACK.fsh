//STIN+STOR+SLHJ
Instance: TestinstanceUFHV15-with-ACK
InstanceOf: TestScript


* insert Metadata
* id = "UFHV15-with-ACK"
* name = "Dies during leave"
* title = "Patient is admitted, goes on leave from the hospital and dies during leave"
* description = "Testing correct use of admit and discharge"

//Once per testscript
* insert ACKFixture 

//param: type, number fixture
* insert HospitalNotificationCreateTest(STIN, 1, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STIN-UF_H_V_20.xml)

//param: type, number fixture
* insert HospitalNotificationCreateTest(STOR, 2, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-STOR-UF_H_V_20.xml)


//param: type, number fixture
* insert HospitalNotificationCreateTest(MORS, 3, /FHIRSandbox/MedCom/401-Hospitalnotification/send/Userstory/_reference/resources/HospitalNotificationMessage-MORS-UF_H_V_20.xml)
